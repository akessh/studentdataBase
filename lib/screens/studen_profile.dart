
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_task/const/kconst.dart';
import 'package:hive_task/model/db_studentModel.dart';


class StudentProfile extends StatelessWidget {
  final box = Hive.box<Studentmodel>('student');
  final Studentmodel obj;

StudentProfile({super.key, required this.obj });


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ktheme,
        title:const Text('Student Profile'),
        centerTitle: true,
        elevation: 10,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            ClipRRect(
                      child: Image.file(
                        File(obj.imagePath),
                        width: 250,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
               
           Text("Name : ${obj.name}"),

          SizedBox(height: 15,),
             Text("Age : ${obj.age}"),

            SizedBox(height: 15,),
             Text("Roll No : ${obj.rollno}"),

           SizedBox(height: 15,),
            Text("Father's Name : ${obj.father}"),

           SizedBox(height: 15,),
          ]
              ),
      ),

          
              
    


         
    );
      

        
      
  }
}