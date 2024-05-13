import 'package:flutter/material.dart';
import 'package:sutdent_provider/models/student_model.dart';
import 'package:sutdent_provider/utils/constants.dart';
import 'package:sutdent_provider/widgets/student_detail/common_heading.dart';

class PersonalCard extends StatelessWidget {
  const PersonalCard({super.key, required this.student});
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          const CommonHeading(
              icon: Icons.person, title: 'Personal informations'),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Age:', style: studentDetailStyle),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      student.age.toString(),
                      style: studentDetailStyle,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text('Address:', style: studentDetailStyle),
                Text(student.address, style: studentDetailStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
