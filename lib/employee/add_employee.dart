import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/employee/employee_controller.dart';
import 'package:getx_practice/employee/model.dart';

class AddEmployeeScreen extends StatelessWidget {
  AddEmployeeScreen(this.employee, {super.key});
  final Employees? employee;
  final EmployeeController c = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
      ),
      body: Form(
        key: c.formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric( horizontal: 36),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              TextFormField(
                initialValue: employee !=null ? employee!.name : '',
                onSaved: (newValue) {
                  c.onSaveName(newValue);
                },
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLength: 3,
                keyboardType: TextInputType.number,
                onSaved: (newValue) {
                  c.onSaveId(newValue);
                },
                initialValue: employee !=null ? employee!.id.toString() : '',
                decoration: InputDecoration(
                  labelText: 'Id',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
                ),),
                const SizedBox(height: 12),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  c.onSave();
                }, child: const Text('Save')))
            ],),
          )
        ),
      ),
    );
  }
}