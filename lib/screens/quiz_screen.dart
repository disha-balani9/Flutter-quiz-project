import 'package:flutter/material.dart';
import '../data/questions.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int index = 0;
  int score = 0;

  void nextQuestion(String selectedAnswer) {
    if (selectedAnswer == questions[index]["answer"]) {
      score++;
    }

    if (index < questions.length - 1) {
      setState(() {
        index++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(score: score),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var current = questions[index];

    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              current["question"],
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(height: 20),

            ...current["options"].map<Widget>((option) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => nextQuestion(option),
                  child: Text(option),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}