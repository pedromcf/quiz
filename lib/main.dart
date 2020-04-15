import 'package:flutter/material.dart';

main() => runApp(new QuizApp());

class QuizApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(      
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Text('Olá Flutter!!!'),
      ),
    );     
  }
}