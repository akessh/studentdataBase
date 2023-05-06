

// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_task/model/db_studentModel.dart';
import 'package:image_picker/image_picker.dart';

class StudentControllers extends GetxController{
 List<Studentmodel> studentdata = [];
  Future<void> getingStudentlist() async {
    final box = await Hive.openBox<Studentmodel>('student');
    studentdata = box.values.toList();
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Future<void> addingTobox(namecontroller, agecontroller, fatherController,
      rollnoController, imagePath) async {
    // String? imagePath;
    final _namecontroller1 = namecontroller.text.trim();
    final _agecontroller1 = int.parse(agecontroller.text.trim());
    final _rollnoController1 = int.parse(rollnoController.text.trim());
    final _fatherController1 = fatherController.text.trim();
    if (_namecontroller1.isNotEmpty) {
      final data = Studentmodel(
        father:_fatherController1 ,
        rollno: _rollnoController1,imagePath:  imagePath,
          name: _namecontroller1,
          age: _agecontroller1,
         
         );

      final box = await Hive.openBox<Studentmodel>('student');

      await box.add(data);


      studentdata = box.values.toList();
      // log(studentdata.toString());
    }

    update();
  }

  deleteStudent(index) async {
    final box = await Hive.box<Studentmodel>('student');

    // if (index >= 0) {
      await box.deleteAt(index);
    // }

    studentdata = box.values.toList();
    update();
  }

  Future<void> editbox(namecontroller, agecontroller, rollnoController,
      fatherController, imagePath, index) async {
     final _namecontroller1 = namecontroller.text.trim();
    final _agecontroller1 = int.parse(agecontroller.text.trim());
    final _rollnoController1 = int.parse(rollnoController.text.trim());
    final _fatherController1 = fatherController.text.trim();
    if (_namecontroller1.isNotEmpty) {
      final data = Studentmodel(
         father:_fatherController1 ,
        rollno: _rollnoController1,
        imagePath:  imagePath,
          name: _namecontroller1,
          age: _agecontroller1,);

      final box = await Hive.openBox<Studentmodel>('student');

      await box.putAt(index, data);

      studentdata = box.values.toList();
    }

    update();
  }

  XFile? image;

  String? imagePath;

  getImage({required ImageSource source}) async {
    image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      // setState(() {
      imagePath = (image!.path);
      update();
      // });
    } else {
      return null;
    }
  }





  List<Studentmodel> searchedstudent = [];
  final searchcontroller1 = TextEditingController();

  searchStudent(value) {
    searchedstudent = studentdata
        .where((element) => element.name.contains(value))
        .toList();

    update();
  }
 
}