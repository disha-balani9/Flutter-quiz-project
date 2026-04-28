import 'package:flutter/material.dart';
import 'category_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz Categories")),
      body: Center(
        child: ElevatedButton(
          child: Text("Browse Categories"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CategoryScreen()),
            );
          },
        ),
      ),
    );
  }
}