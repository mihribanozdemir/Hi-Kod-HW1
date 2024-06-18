import 'package:flutter/material.dart';
import 'hw5homepage.dart';
import 'hw5secondpage.dart';

void main() {
  runApp(HomeworkApp());
}
class HomeworkApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/second': (context) => SecondPage(),
    },
  );
}
}
