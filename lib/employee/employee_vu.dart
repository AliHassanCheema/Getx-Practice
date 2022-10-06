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
       WillPopScope(
         onWillPop: c.onWillPop,
         child: Scaffold(
          appBar: AppBar(
            title: const Text('Getx Practice'),
            centerTitle: true,
            actions: [
              Switch(value: c.isDark.value, onChanged: c.onChangeTheme)
            ],
          ),
          body: c.employees.isEmpty ?
          Center(child: ElevatedButton(onPressed: (){c.onData();}, child: const Text('Load Dummy List'))) :
           ListView.builder(
            itemCount: c.employees.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  onTap: () {
                    Get.to(()=>AddEmployeeScreen(c.employees[index]))?.then((value){
                      c.employees[index] = value;
                    } );

                  },
                  leading:  CircleAvatar(backgroundColor: Colors.white, child: Text(c.employees[index].id!.toString()),),
                  title: Text(c.employees[index].name!),
                  trailing:  IconButton(onPressed: () {
                    c.employees.removeAt(index);
                  },icon: const Icon(Icons.delete, color: Colors.red,),)),
              );
            },
                 ),
          floatingActionButton: c.employees.isEmpty ? const SizedBox() : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(onPressed: () {
                 c.onData();
              },
              heroTag: 1, child: const Icon(Icons.refresh),),
              const SizedBox(width: 60,),
              FloatingActionButton(onPressed: () {
                 Get.to(()=>AddEmployeeScreen(null))?.then((value) => value != null ? c.employees.add(value) : null);
              },heroTag: 2, child: const Icon(Icons.add))
            ],
          ),
         ),
       ));
  }
}