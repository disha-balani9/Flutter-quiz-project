import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class QuizDetailScreen extends StatelessWidget {
  final String category;

  QuizDetailScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Category: $category", style: TextStyle(fontSize: 22)),
            SizedBox(height: 20),
            Text("Total Questions: 3"),
            SizedBox(height: 30),

            ElevatedButton(
              child: Text("Start Quiz"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => QuizScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}