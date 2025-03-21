import 'package:flutter/material.dart';
import 'package:book_management_app/book_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Management App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BookList(),
    );
  }
}
