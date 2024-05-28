import 'package:dars45/models/company.dart';
import 'package:flutter/material.dart';

class CompaniesController with ChangeNotifier {
  final List<Company> _list = [];

  List<Company> get list {
    return [..._list];
  }

  void addCompany(String name, String location) {
    _list.add(Company(name: name, location: location));
  }
}
