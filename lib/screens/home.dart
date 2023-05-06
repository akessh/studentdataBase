
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_task/const/kconst.dart';
import 'package:hive_task/controllers/studentcontrollers.dart';
import 'package:hive_task/screens/add_student.dart';
import 'package:hive_task/screens/edit.dart';
import 'package:hive_task/screens/search.dart';
import 'package:hive_task/screens/studen_profile.dart';

class HomePage extends StatelessWidget {
 const  HomePage({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:ktheme,
        title: const Text('Student Details'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {
            Get.to(ScreenSearch());
          }, icon:const Icon(Icons.search))
         
        ],
      ),
      body:  GetBuilder(
        init: StudentControllers(),
        
        builder: (c) {
          return ListView.builder(
                  itemBuilder: (context, index) {
                    final student = c.studentdata[index];
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                      child: ListTile(
                          onTap: () => Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  StudentProfile(obj: student,))),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          title: Text(student.name),
                          leading:
                              student.imagePath == null
                          ? const CircleAvatar(
                              backgroundColor: ktheme,
                              // backgroundImage: AssetImage(
                              //     'assets/117-1176594_student-learning-education-college-student-vector-png-transparent.png'),
                              radius: 25,
                            )
                          : CircleAvatar(
                              radius: 25,
                              child: ClipOval(
                                child: Image.file(
                                  File(student.imagePath),
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                // 
                                //
                                onPressed: (){
                                  Get.to(EditStudent(obj: student,index: index,));
                                },
                               
                                icon: const Icon(
                                  Icons.edit,
                                  color: kblack,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Are you sure? '),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                Get.back();
                                                },
                                                child: const Text('No')),
                                            TextButton(
                                                onPressed: () {
                                                 c.deleteStudent(index);
                                                                                                   Navigator.pop(context);
                                                  Get.back();

                                                },
                                                child: const Text('Yes'))
                                          ],
                                        );
                                      });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color:kblack,
                                ),
                              ),
                            ],
                          )),
                    );
                  },

                  itemCount: c.studentdata.length
          
                );
        }
      ),

          
      floatingActionButton: FloatingActionButton(
        backgroundColor: ktheme,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  AddStudent()));
        },
      ),
    );
  }
}
