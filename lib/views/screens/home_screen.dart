import 'package:dars45/controllers/companies_controller.dart';
import 'package:dars45/views/widgets/add_company_dialog.dart';
import 'package:dars45/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final companiesController = CompaniesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Kompaniyalar",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              final response = await showDialog(
                context: context,
                builder: (ctx) {
                  return const AddCompanyDialog();
                },
              );

              if (response != null) {
                companiesController.addCompany(
                  response['name'],
                  response['location'],
                );
                setState(() {});
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: companiesController.list.length,
          itemBuilder: (ctx, index) {
            final company = companiesController.list[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          company.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Xodimlar: ${company.employees?.length ?? 0}",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(company.location),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Mahsulotlar: ${company.products?.length ?? 0}",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
