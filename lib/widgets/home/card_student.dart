import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sutdent_provider/models/student_model.dart';
import 'package:sutdent_provider/provider/student_provider.dart';
import 'package:sutdent_provider/provider/students_provider.dart';
import 'package:sutdent_provider/screens/add_student.dart';
import 'package:sutdent_provider/screens/student_detail.dart';
import 'package:sutdent_provider/widgets/snackbar.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({super.key, required this.student});
  final StudentModel student;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<StudentProvider>(context, listen: false);
    final studentProvider =
        Provider.of<SingleStudentProvider>(context, listen: false);
    return Hero(
      tag: student.key,
      child: GestureDetector(
        onTap: () {
          studentProvider.selectStudent(student);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => const DetailedStudetnt(),
            ),
          );
        },
        onLongPress: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await provider.deleteStudent(student.key).then(
                          (value) {
                            Navigator.pop(context);
                            CustomSnackbar.show(
                                context, 'Student info deleted');
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.check,
                        color: Colors.green,
                      ),
                    ),
                  ],
                )
              ],
              title: const Text(
                'Are you sure you want to delete?',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
            ),
          );
        },
        child: Card(
          color: const Color.fromARGB(255, 255, 248, 225),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: student.profilePicture != null
                      ? FileImage(File(student.profilePicture!))
                      : null,
                  child: student.profilePicture == null
                      ? const Icon(
                          Icons.person,
                          size: 30,
                        )
                      : null,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      student.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(student.batch),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => AddStudentPage(
                              student: student,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
