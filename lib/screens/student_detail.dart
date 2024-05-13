import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sutdent_provider/provider/student_provider.dart';
import 'package:sutdent_provider/screens/add_student.dart';
import 'package:sutdent_provider/widgets/student_detail/contact_card.dart';
import 'package:sutdent_provider/widgets/student_detail/personal_card.dart';
import 'package:sutdent_provider/widgets/student_detail/profile_card.dart';

class DetailedStudetnt extends StatelessWidget {
  const DetailedStudetnt({
    super.key,
  });

  void removeStudent(int id, BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Are you sure you want to delete?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel')),
          TextButton(
              onPressed: () async {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Record deleted"),
                    ),
                  );
                }
              },
              child: const Text('ok')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final student = Provider.of<SingleStudentProvider>(context, listen: true);
    final currentStudent = student.selectedStudent;
    if (currentStudent == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text('Student not found'),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddStudentPage(student: currentStudent),
                  ),
                );
              },
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ))
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Student Details',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromRGBO(165, 214, 167, 1),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProfieCard(student: currentStudent),
            ContactCard(student: currentStudent),
            const Divider(),
            PersonalCard(student: currentStudent),
          ],
        ),
      ),
    );
  }
}
