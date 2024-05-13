import 'package:flutter/material.dart';
import 'package:sutdent_provider/models/student_model.dart';

class SingleStudentProvider extends ChangeNotifier {
  StudentModel? _selectedStudent;
  StudentModel? get selectedStudent => _selectedStudent;
  void selectStudent(StudentModel student) {
    _selectedStudent = student;
    notifyListeners();
  }
}
