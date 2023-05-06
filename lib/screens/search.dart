import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_task/const/kconst.dart';
import 'package:hive_task/screens/studen_profile.dart';

import '../controllers/studentcontrollers.dart';
import 'edit.dart';
// import 'package:flutter/src/widgets/framework.dart';



class ScreenSearch extends StatelessWidget {
   ScreenSearch({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("Search",),
        backgroundColor:ktheme,
        
      ),
      body: GetBuilder(
        init: StudentControllers(),
        builder: (c) {
          return Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
               Padding(
                padding: EdgeInsets.all(5),
                child: TextField(
                  controller: c.searchcontroller1,
                  onChanged: (value) {
                    c.searchStudent(value);
                  },
                   decoration: const InputDecoration(
                    
                              prefixIcon: Icon(Icons.search,color: ktheme,),
                              hintText: 'Search',
                              
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: ktheme),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3, color: ktheme),
                              ),
                            ),
                ),
              ),
              Expanded(
                child: 
                
                                c.searchcontroller1.text.isNotEmpty
                            ? ListView.builder(
                                itemBuilder: (context, index) {
                                  final student =
                                      c.searchedstudent[index];
                                  return ListTile(
                                     onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      StudentProfile(obj: student,))),
                                    leading: student.imagePath == null
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
                                                File(student.imagePath!),
                                                width: 50,
                                                height: 50,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                    title: Text(student.name)
                                    
                                  );
                                },
                                itemCount:
                                    c.searchedstudent.length,
                              ):
                 ListView.builder(
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
              
                    ),
      

              )
            ],
          );
        }
      )
    );
  }
}