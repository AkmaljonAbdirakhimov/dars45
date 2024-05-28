import 'package:flutter/material.dart';

class AddCompanyDialog extends StatefulWidget {
  const AddCompanyDialog({super.key});

  @override
  State<AddCompanyDialog> createState() => _AddCompanyDialogState();
}

class _AddCompanyDialogState extends State<AddCompanyDialog> {
  final formKey = GlobalKey<FormState>();
  String name = "";
  String location = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Kompaniya qo'shing"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Bekor qilish"),
        ),
        FilledButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();

              Navigator.pop(context, {
                "name": name,
                "location": location,
              });
            }
          },
          child: const Text("Yaratish"),
        ),
      ],
      content: Container(
        constraints: const BoxConstraints(maxHeight: 180),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Nomi",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Iltimos kompaniya nomini kiriting";
                  }

                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    name = newValue;
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Manzil",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Iltimos kompaniya manzilini kiriting";
                  }

                  return null;
                },
                onSaved: (newValue) {
                  if (newValue != null) {
                    location = newValue;
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
