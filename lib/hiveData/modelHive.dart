
import 'package:hive/hive.dart';
 // This will be generated

@HiveType(typeId: 0)
class UserData {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String mobileNo;

  @HiveField(2)
  final int age;

  @HiveField(3)
  final String height;

  @HiveField(4)
  final String weight;

  @HiveField(5)
  final String lastMenstrualDate;

  @HiveField(6)
  final String city;

  @HiveField(7)
  final String dist;

  @HiveField(8)
  final String state;

  @HiveField(9)
  final String teh;

  @HiveField(10)
  final String userType;

  @HiveField(11)
  final String pId;

  @HiveField(12)
  final bool isLog;

  // Add other fields as needed

  UserData({
    required this.name,
    required this.mobileNo,
    required this.age,
    required this.height,
    required this.weight,
    required this.lastMenstrualDate,
    required this.city,
    required this.dist,
    required this.state,
    required this.teh,
    required this.userType,
    required this.pId,
    required this.isLog
  });
}
