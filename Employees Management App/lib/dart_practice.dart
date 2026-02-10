void main() {
  String vnesenaVrednost = 'dvaeset';

  try {
    int age = int.parse(vnesenaVrednost);
    print('You are $age years old');
  } catch (e) {
    print('You entered invalid format of age');
  } finally {
    print('Thanks for visiting us.');
  }

  // List<Employee> employees = [
  //   Employee(name: 'Stojance', salary: 600),
  //   Employee(name: 'Ana', salary: 450),
  //   Employee(name: 'Marko', salary: 800),
  //   Employee(name: 'Elena', salary: 300),
  //   Manager(name: 'Trajce', salary: 1200, department: 'Finance'),
  // ];

  // double totalSalaryExpanse = 0;

  // for (var emp in employees) {
  //   totalSalaryExpanse += emp.salary;
  // }

  // print('Total Salary Expenses: \$${totalSalaryExpanse.toStringAsFixed(2)}');
}
