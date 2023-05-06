import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_task/controllers/studentcontrollers.dart';
import 'package:hive_task/model/db_studentModel.dart';
import 'package:hive_task/screens/home.dart';
StudentControllers     controllers = Get.put(StudentControllers());
Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentmodelAdapter());
 await Hive.openBox<Studentmodel>('student');
controllers.getingStudentlist();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}

