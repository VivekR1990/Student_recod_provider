import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:sutdent_provider/controllers/hive_box.dart';
import 'package:sutdent_provider/models/student_model.dart';

class StudentProvider extends ChangeNotifier {
  List<StudentModel> _students = [];
  static Box<StudentModel> box = Hive.box(studentbox);

  List<StudentModel> get students => _students;
  StudentProvider() {
    initialize();
  }
  // Initialize the provider with data from Hive
  Future<void> initialize() async {
    _students = box.values.toList();
    notifyListeners();
  }

  // Method to add a student
  Future<void> addStudent(StudentModel student) async {
    try {
      await box.add(student);
      _students = box.values.toList();
      notifyListeners();
    // ignore: empty_catches
    } catch (e) {
    }
  }

  // Method to delete a student by key
  Future<void> deleteStudent(int key) async {
    try {
      await box.delete(key);
      _students = box.values.toList();
      notifyListeners();
    // ignore: empty_catches
    } catch (e) {
    }
  }

  // Method to update a student
  Future<void> updateStudent(var key, StudentModel student) async {
    await box.put(key, student);
    _students = box.values.toList();
    notifyListeners();
    
  }

  void searchStudents(String input) {
    if (input.isEmpty) {
      _students = box.values.toList();
    } else {
      _students = box.values
          .where((student) =>
              student.name.toLowerCase().contains(input.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
