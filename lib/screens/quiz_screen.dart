import 'package:flutter/material.dart';
import '../Services/api_service.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {

  final String category;

  const QuizScreen({super.key, required this.category});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {

  List questions = [];
  int index = 0;
  int score = 0;
  bool isLoading = true;


  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  void loadQuestions() async {

    final data = await ApiService.getQuestions(widget.category);

    setState(() {
      questions = data;
      isLoading = false;
    });
  }

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
          builder: (_) =>ResultScreen(
            score: score,
            total: questions.length,
            category: widget.category,
          )
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    var current = questions[index];
    List options = [
      current["option1"],
      current["option2"],
      current["option3"],
      current["option4"],
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            Text(
              current["question"],
              style: TextStyle(fontSize: 22),
            ),

            SizedBox(height: 20),

          ...options.map((option) {
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