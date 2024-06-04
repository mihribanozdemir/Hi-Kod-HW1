import 'package:flutter/material.dart';
import 'hw3.dart'; // Dosya adını buraya güncelledik

void main() {
  runApp(HomeworkApp());
}

class HomeworkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homework(),
    );
  }
}
