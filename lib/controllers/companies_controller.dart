import 'package:dars45/models/company.dart';

class CompaniesController {
  final List<Company> _list = [];

  List<Company> get list {
    return [..._list];
  }

  void addCompany(String name, String location) {
    _list.add(Company(name: name, location: location));
  }
}
