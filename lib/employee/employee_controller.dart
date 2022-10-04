import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'model.dart';

class EmployeeController extends GetxController{
  final formKey = GlobalKey<FormState>();
   RxString name = ''.obs;
   RxString id = ''.obs;
   RxList<Employees> employees = <Employees>[].obs; 
   Employees? employee;

   onChange(){
    employees.clear();
    for(int i = 0; i<10; i++){
      employees.add(Employees(generateRandomString(i+1), '${i+1}'.obs));
    }
   }

   String generateRandomString(int length) {
   var r = Random();
   const chars = 'Getx';
   return List.generate(length, (index) => chars[r.nextInt(chars.length)]).join();
   }

   onSaveName(value){
    name.value = value;
   }
   onSaveId(value){
    id.value = value;
   }

   onSave(){
    formKey.currentState!.save();
    employee = Employees(name.value, id);
    Get.back(result: employee);
   }
}





  // String generateRandomString(int len) {
  //   var r = Random();
  //   String randomString =String.fromCharCodes(List.generate(len, (index)=> r.nextInt(33) + 89));
  //     return randomString;
  //   }