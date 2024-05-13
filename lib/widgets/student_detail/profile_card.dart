import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sutdent_provider/models/student_model.dart';
import 'package:sutdent_provider/utils/constants.dart';

class ProfieCard extends StatelessWidget {
  const ProfieCard({super.key, required this.student});
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: const LinearGradient(
            colors: [
              Color.fromRGBO(165, 214, 167, 1),
              Color.fromARGB(255, 171, 233, 96)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Row(
            children: [
              student.profilePicture == null
                  ? ClipOval(
                      child: Image.asset(
                        'assets/images/profile.jpg',
                        width: 140.0,
                        height: 140.0,
                        fit: BoxFit.cover,
                      ),
                    )
                  : ClipOval(
                      child: Image.file(
                        File(student.profilePicture!),
                        width: 140.0,
                        height: 140.0,
                        fit: BoxFit.cover,
                      ),
                    ),
              const SizedBox(
                width: 30,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(student.name, style: studentDetailStyle),
                    Text(student.batch, style: studentDetailStyle),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
