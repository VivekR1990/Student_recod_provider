import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final int age;

  @HiveField(2)
  final String batch;

  @HiveField(3)
  final String address;

  @HiveField(4)
  final int contactNumber;

  @HiveField(5)
  final String emailAddress;

  @HiveField(6)
  final String? profilePicture;

  @HiveField(7)
  final String parentName;

  @HiveField(8)
  final DateTime dob;

  StudentModel({
    required this.name,
    required this.age,
    required this.batch,
    required this.address,
    required this.contactNumber,
    required this.emailAddress,
    required this.profilePicture,
    required this.parentName,
    required this.dob,
  });
}
