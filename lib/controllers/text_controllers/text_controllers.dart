import 'package:flutter/material.dart';
import 'package:sutdent_provider/models/student_model.dart';

class StudentDataControllers {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController guardianController = TextEditingController();
  final TextEditingController batchController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  void getStudentDetails(StudentModel student) {
    nameController.text = student.name;
    guardianController.text = student.parentName;
    batchController.text = student.batch;
    ageController.text = student.age.toString();
    contactController.text = student.contactNumber.toString();
    emailController.text = student.emailAddress;
    addressController.text = student.address;
  }
}
