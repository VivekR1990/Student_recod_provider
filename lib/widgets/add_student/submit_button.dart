import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sutdent_provider/models/student_model.dart';
import 'package:sutdent_provider/provider/image_provider.dart';
import 'package:sutdent_provider/provider/student_provider.dart';
import 'package:sutdent_provider/provider/students_provider.dart';
import 'package:sutdent_provider/controllers/text_controllers/text_controllers.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton(
      {super.key,
      required this.formKey,
      required this.studentController,
      required this.studentItem});
  final StudentDataControllers studentController;
  final GlobalKey<FormState> formKey;
  final StudentModel? studentItem;
  @override
  Widget build(BuildContext context) {
    final SingleStudentProvider currentStudentProvider =
        Provider.of<SingleStudentProvider>(context, listen: false);
    final StudentProvider studentProvider =
        Provider.of<StudentProvider>(context, listen: false);
    final ImageProvide imgProvider =
        Provider.of<ImageProvide>(context, listen: false);
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.green[200],
        ),
        onPressed: () async {
          if (!formKey.currentState!.validate()) return;

          final StudentModel student = StudentModel(
            name: studentController.nameController.text.trim(),
            age: int.parse(studentController.ageController.text.trim()),
            batch: studentController.batchController.text.trim(),
            address: studentController.addressController.text.trim(),
            contactNumber:
                int.parse(studentController.contactController.text.trim()),
            emailAddress: studentController.emailController.text.trim(),
            profilePicture: imgProvider.image?.path,
            parentName: studentController.guardianController.text.trim(),
            dob: DateTime.now(),
          );

          if (studentItem == null) {
            await studentProvider.addStudent(student);
          } else {
            await studentProvider.updateStudent(studentItem!.key, student);
            currentStudentProvider.selectStudent(student);
          }
          if (context.mounted) Navigator.pop(context);
        },
        child: Text(
          studentItem == null ? 'ADD STUDENT' : 'UPDATE STUDENT',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
