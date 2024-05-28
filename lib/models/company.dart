import 'package:dars45/models/employee.dart';
import 'package:dars45/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  String name;
  String location;
  List<Employee>? employees = [];
  List<Product>? products = [];

  Company({
    required this.name,
    required this.location,
    this.employees,
    this.products,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return _$CompanyFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CompanyToJson(this);
  }
}
