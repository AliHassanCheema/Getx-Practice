import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'model.dart';

class EmployeeController extends GetxController{
  Employees? employee;
  RxString id = ''.obs;
  RxString name = ''.obs;
  RxBool isDark = false.obs;
  Rx isValidated = false.obs;
  final formKey = GlobalKey<FormState>();
  RxList<Employees> employees = <Employees>[].obs;

  onData(){
    employees.clear();
    for(int i = 0; i<10; i++){
      employees.add(Employees(onGenerateRandomString(i+1), '${i+1}'));
    }
    Get.snackbar('Data', 'Data is Loaded', snackPosition: SnackPosition.BOTTOM);
  }

  String onGenerateRandomString(int length) {
   var r = Random();
   const chars = 'Getx';
   return List.generate(length, (index) => chars[r.nextInt(chars.length)]).join();
  }

  onChangeTheme(value){
      isDark.value = value;
      if(isDark.value){
        Get.changeTheme(ThemeData.dark());
      }else{
        Get.changeTheme(ThemeData.light());
      }
  }

  Future<bool> onWillPop() async {
    bool isExit = false;
    await Get.defaultDialog(title: 'EXIT', 
        content: const Text('DO you want to exit the app?'),
        contentPadding: const EdgeInsets.all(36),
        textConfirm: 'Yes',textCancel: 'No', onConfirm: (){
      isExit = true;
      Get.back();
      Get.back();
    },onCancel: (){Get.back();});
    return isExit;
  }

  onSaveName(value){
    name.value = value;
  }
  onSaveId(value){
    id.value = value;
  }

  onSave(){
    formKey.currentState!.save();
    employee = Employees(name.value, id.value);
    if(name.value != '' && id.value != ''){
      isValidated.value = true;
      Get.back(result: employee);

    }else{
    Get.back(result: null);
    }
  }
}





  // String generateRandomString(int len) {
  //   var r = Random();
  //   String randomString =String.fromCharCodes(List.generate(len, (index)=> r.nextInt(33) + 89));
  //     return randomString;
  //   }