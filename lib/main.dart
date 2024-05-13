import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sutdent_provider/provider/student_provider.dart';
import 'package:sutdent_provider/screens/home_page.dart';
import 'package:sutdent_provider/utils/hive_box.dart';
import 'package:sutdent_provider/models/student_model.dart';
import 'package:sutdent_provider/provider/image_provider.dart';
import 'package:sutdent_provider/provider/students_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentModelAdapter());

  await Hive.openBox<StudentModel>(studentbox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImageProvide(),
        ),
        ChangeNotifierProvider(
          create: (context) => SingleStudentProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(165, 214, 167, 1)),
            useMaterial3: true,
          ),
          home: HomePage()),
    );
  }
}
