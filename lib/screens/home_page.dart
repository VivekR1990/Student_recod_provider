import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sutdent_provider/controllers/debouncer.dart';
import 'package:sutdent_provider/models/student_model.dart';
import 'package:sutdent_provider/provider/students_provider.dart';
import 'package:sutdent_provider/screens/add_student.dart';
import 'package:sutdent_provider/controllers/constants.dart';
import 'package:sutdent_provider/widgets/home/card_student.dart';


// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  final debouncer = Debouncer(milliseconds: 500);

  @override
  Widget build(BuildContext context) {
    final StudentProvider provider =
        Provider.of<StudentProvider>(context, listen: false);
    return ColoredBox(
      color:  const Color.fromRGBO(165, 214, 167, 1),
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => const AddStudentPage(
                    student: null,
                  ),
                ),
              );
            },
            child: const Icon(Icons.add),
          ),
          body: Column(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(165, 214, 167, 1),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 6,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Student Record',
                        style: appbarTextStyle,
                      ),
                      k10Height,
                      SizedBox(
                        height: 50,
                        child: TextField(
                          decoration: const InputDecoration(
                            fillColor: Color.fromARGB(255, 255, 248, 225),
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            hintText: 'Search Students',
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                            prefixIcon: Icon(Icons.search_rounded),
                          ),
                          onChanged: (value) => debouncer
                              .call(() => provider.searchStudents(value)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Consumer<StudentProvider>(
                builder: (context, value, child) {
                  final List<StudentModel> students = value.students;

                  return students.isEmpty
                      ? Expanded(
                          child: Center(
                            child: Lottie.asset('assets/images/nodata.json',
                                width: 400),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: students.length,
                            itemBuilder: (context, index) {
                              return StudentCard(student: students[index]);
                            },
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
