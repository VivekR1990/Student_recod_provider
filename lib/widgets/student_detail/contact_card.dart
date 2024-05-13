import 'package:flutter/material.dart';
import 'package:sutdent_provider/models/student_model.dart';
import 'package:sutdent_provider/utils/constants.dart';
import 'package:sutdent_provider/widgets/student_detail/common_heading.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.student});
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            const CommonHeading(
                icon: Icons.contact_emergency, title: 'Contact Informations'),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10),
              child: Row(
                children: [
                  const Icon(Icons.email),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(student.emailAddress, style: studentDetailStyle),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  const Icon(Icons.phone_android),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(student.contactNumber.toString(),
                      style: studentDetailStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
