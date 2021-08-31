import 'package:flutter/material.dart';

import 'package:educagil/ui/home.dart';
import 'package:educagil/ui/login.dart';
import 'package:educagil/ui/classroom.dart';
import 'package:educagil/ui/about.dart';
import 'package:educagil/ui/profile.dart';

import 'package:provider/provider.dart';
import 'package:educagil/models/classroommodel.dart';

import 'package:flutter/rendering.dart';

void showLayoutGuidelines() {
  debugPaintSizeEnabled = true;
}

void main() {
  //showLayoutGuidelines();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ClassroomModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'educagil',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/login': (context) => Login(),
        '/classroom': (context) => Classroom(),
        '/about': (context) => About(),
        '/profile': (context) => Profile(),
      },
    );
  }
}
