import './employee.dart';

class Manager extends Employee {
  Manager({
    required super.name,
    required super.salary,
    required this.department,
  });

  String department;
}
