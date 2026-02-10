import 'package:flutter/material.dart';
import './manager.dart';
import './employee.dart';

List<Employee> employees = [
  Employee(name: 'Stojance', salary: 600),
  Employee(name: 'Ana', salary: 450),
  Employee(name: 'Marko', salary: 800),
  Employee(name: 'Elena', salary: 300),
  Manager(name: 'Trajce', salary: 1200, department: 'Finance'),
  Employee(name: 'Gjorgji', salary: 650),
  Employee(name: 'Daniel', salary: 700),
  Manager(name: 'Maki', salary: 1400, department: 'Economy'),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Employees App'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          final emp = employees[index];

          return Dismissible(
            key: Key(emp.name + index.toString()),
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              setState(() {
                employees.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${emp.name} е избришан од листата')),
              );
            },
            child: Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Информации за ${emp.name}'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: emp is Manager
                        ? Colors.orange
                        : Colors.blue,
                    child: Icon(
                      emp is Manager ? Icons.star : Icons.person,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(emp.name),
                  subtitle: Text('Плата: ${emp.salary} €'),
                  trailing: emp is Manager
                      ? Text(
                          emp.department,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      : null,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            employees.add(
              Employee(name: 'Нов колега ${employees.length}', salary: 500),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
