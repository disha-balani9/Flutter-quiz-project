import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'quiz_screen.dart';
import 'category_screen.dart';
class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final String category;

  ResultScreen({
    required this.score,
    required this.total,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Score Text
              Text(
                "Your Score",
                style: TextStyle(fontSize: 22),
              ),

              SizedBox(height: 10),

              Text(
                "$score",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              SizedBox(height: 30),

              // Retry Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Retry Quiz"),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_)  => QuizScreen(category: category),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 15),

              // Go Home Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Go to Home"),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomeScreen(),
                      ),
                          (route) => false,
                    );
                  },
                ),
              ),

              SizedBox(height: 15),

              // Choose Category Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text("Choose Category"),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(),
                      ),
                          (route) => false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}