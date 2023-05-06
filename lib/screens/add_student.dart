

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_task/const/kconst.dart';
import 'package:hive_task/controllers/studentcontrollers.dart';
import 'package:hive_task/model/db_studentModel.dart';
import 'package:image_picker/image_picker.dart';


class AddStudent extends StatelessWidget {
   AddStudent({super.key});

   final TextEditingController nameController=TextEditingController();

   final TextEditingController ageController=TextEditingController();

   final TextEditingController rollnoController=TextEditingController();

   final TextEditingController fathernameController=TextEditingController();
   XFile? image;

  String? imagepath;
  var box = Hive.box<Studentmodel>('student');

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: StudentControllers(),
      builder: (c) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ktheme,
            centerTitle: true,
            title:const Text('ADD DETAILS'),
          ),
          body:  Form(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(children: [
                imagepath == null?const CircleAvatar(backgroundColor: kwhite,):
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.file(
                        File(imagepath!),
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                          //NameField
                          TextFormField(
                      controller: nameController,
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Name'
                
                      ),
                
                     ),
                    const SizedBox(height: 15,),
                
                    //AgeField
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: ageController,
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Age'
                
                      ),
                
                     ),
                    const SizedBox(height: 15,),
                
                     //RollNumberField
                
                     TextFormField(
                      keyboardType: TextInputType.number,
                      controller: rollnoController,
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Roll-No'
                
                      ),
                
                     ),
                    const   SizedBox(height: 15,),
                
                     //FatherNameField
                
                     TextFormField(
                      controller: fathernameController,
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Father Name'
                
                      ),
                
                     ),
                
                   const  SizedBox(height:15 ,),
                    ElevatedButton(
                          style: ElevatedButton.styleFrom(
                                primary: ktheme,),
                          onPressed:() {
                         getimage(source: ImageSource.camera);
                          }, 
                           child:const Icon(Icons.camera_alt_outlined)
                   ),
                    
                    
                     const SizedBox(height: 15,),
                
                     Container(
                      width: double.infinity,
                       child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:ktheme,),
                            onPressed: ()async{
                            await  c.addingTobox(nameController, ageController,fathernameController,rollnoController,imagepath);
                              // Get.back();
                             Navigator.of(context).pop();
                            },
                             child:const Text('ADD'))
                         
                     ),
                
                
                        ],
                          
                        ),
                      )
                    ],
                  ),
                )
            
        );
      }
    );
  }

  
   void getimage({required ImageSource source, })async{
  var  image=await ImagePicker().pickImage(source: source);
    if(image !=null){
      
         imagepath=(image.path);
        
      
    }else{
      return null;
    }
  }

}


  