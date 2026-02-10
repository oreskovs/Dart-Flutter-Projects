import 'package:dart_practice/employee_model.dart';

class Manager extends Employee {
  Manager({
    required super.name,
    required super.salary,
    required this.department,
  });

  String department;
}
