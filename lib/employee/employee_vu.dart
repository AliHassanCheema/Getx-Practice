import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/employee/add_employee.dart';
import 'package:getx_practice/employee/employee_controller.dart';

class EmployeeScreen extends StatelessWidget {
  EmployeeScreen({super.key});
  final EmployeeController  c = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
       Scaffold(
        appBar: AppBar(
          title: const Text('Getx Practice'),
          centerTitle: true,
        ),
        body: c.employees.isEmpty ? 
        Center(child: ElevatedButton(onPressed: (){c.onChange();}, child: const Text('Load Dummy List'))) :
         ListView.builder(
          itemCount: c.employees.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () {
                  Get.to(AddEmployeeScreen(c.employees[index]))?.then((value) => c.employees.add(value));
                },
                tileColor: const Color.fromARGB(255, 114, 179, 117),
                leading:  CircleAvatar(backgroundColor: Colors.white, child: Text(c.employees[index].id!.toString()),),
                title: Text(c.employees[index].name!),
                trailing:  IconButton(onPressed: () {
                  c.employees.removeAt(index);
                },icon: const Icon(Icons.delete, color: Colors.red,),)),
            );
          },
        ),
        floatingActionButton: c.employees.isEmpty ? const SizedBox() : FloatingActionButton(onPressed: () {
           c.onChange();
        }, child: const Icon(Icons.refresh_rounded),),
       ));
  }
}