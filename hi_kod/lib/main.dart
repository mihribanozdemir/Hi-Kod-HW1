import 'package:flutter/material.dart';
import 'hw3.dart'; // Dosya adını buraya güncelledik
import 'hw4.dart';
void main() {
  runApp(HomeworkApp());
}

class HomeworkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Week6(),
    );
  }
}
