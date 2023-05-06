
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'db_studentModel.g.dart';

@HiveType(typeId: 0)
class Studentmodel extends HiveObject {
@HiveField(0)
 final String name;
@HiveField(1)
 final int age;
@HiveField(2)
 final int rollno;
@HiveField(3)
final String  father;
@HiveField(4)
 final dynamic imagePath;


 Studentmodel({ required this.name,
      required this.age,
      required this.rollno,
      required this.father,
      this.imagePath,
      });
      
}