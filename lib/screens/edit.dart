
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
import 'package:hive_task/const/kconst.dart';
import 'package:hive_task/controllers/studentcontrollers.dart';
import 'package:hive_task/model/db_studentModel.dart';
import 'dart:core';

import 'package:image_picker/image_picker.dart';
  
StudentControllers controllers = Get.put(StudentControllers());
  
class EditStudent extends StatefulWidget {
  final Studentmodel obj;
  final int index;

  EditStudent({Key? key,required this.obj, required this.index})
      : super(key: key);

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  final box = Hive.box<Studentmodel>('student');

   TextEditingController nameController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  TextEditingController rollnoController = TextEditingController();

  TextEditingController fathernameController = TextEditingController();

  int? newKey;

  int? accessKey;

  

  void details() async{
    nameController.text = widget.obj.name;
    ageController.text = widget.obj.age.toString();
    rollnoController.text = widget.obj.rollno.toString();
   controllers.imagePath = widget.obj.imagePath;
    fathernameController.text = widget.obj.father;

    newKey = widget.obj.key;
    List<Studentmodel> student = box.values.toList();
    for (int i = 0; i < student.length; i++) {
      if (student[i].key == newKey) {
        accessKey = i;
        break;
      }
    }
  }


@override
  void initState() {
   
    details();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   details();
    // },);
        return GetBuilder(
          init: StudentControllers(),
          builder: (controllers) {
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: ktheme,
                  title: const Text('Edit Profile'),
                  elevation: 10,
                  centerTitle: true,
                ),
                body: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          
                             if (controllers.imagePath != null)
                    ClipRRect(
                          child: Image.file(
                            File(controllers.imagePath!),
                            width: 300,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(40),
                    ),
                            
                              const SizedBox(height: 10),
                              TextField(
                              controller: nameController,
                                style:  const TextStyle(fontSize: 16),
                                decoration:const  InputDecoration(
                                    labelText: 'Name', enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ktheme
                                      )
                                    )),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                 controller: ageController,
                                keyboardType: TextInputType.number,
                                style:const  TextStyle(fontSize: 16),
                                decoration:  const InputDecoration(
                                    labelText: 'Age', enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(
                                        color: ktheme
                                      )
                                    )),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                 controller: rollnoController,
                                style:const TextStyle(fontSize: 16),
                                decoration: const InputDecoration(
                                    labelText: 'Roll No ',
                                    enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(
                                        color: ktheme
                                      )
                                    )),
                              ),
                              const SizedBox(height: 10),
                              TextField(
                                 controller: fathernameController,
                                style: const TextStyle(fontSize: 16),
                                decoration: const InputDecoration(
                                    labelText: 'father name',
                                    enabledBorder: OutlineInputBorder(
                                       borderSide: BorderSide(
                                        color: ktheme
                                      )
                                    )),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  // ElevatedButton(
                                  //     onPressed: () =>
                                  //         getImage(source: ImageSource.gallery),
                                  //     child: const Text('Select New Image')),
                                ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                                  primary: ktheme,),
                                      
                                        onPressed: (){
                                        controllers. getImage(source: ImageSource.camera,  );

                                        },
                                        child: const Text('Edit Image'))
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                            primary: ktheme,),
                                  onPressed: () {
                                  controllers.editbox(nameController, ageController, rollnoController, fathernameController, controllers.imagePath, accessKey);
                            Navigator.pop(context);

                                  },
                                  child: const Text('Save Changes'))
                            ],
                          )
                        
                    ),
                  ),
                ));
          }
        );
      
    
  }

// getImage({required ImageSource source}) async {
//     image = await ImagePicker().pickImage(source: source);
//     if (image != null) {
//       // setState(() {
//       imagePath = (image!.path);
//       // });
//     } else {
//       return null;
//     }
//   }
}