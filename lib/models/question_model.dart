class Question {

  final int id;
  final String question;
  final String option1;
  final String option2;
  final String option3;
  final String option4;
  final String answer;

  Question({
    required this.id,
    required this.question,
    required this.option1,
    required this.option2,
    required this.option3,
    required this.option4,
    required this.answer,
  });

  factory Question.fromJson(
      Map<String, dynamic> json) {

    return Question(
      id: json["id"],
      question: json["question"],
      option1: json["option1"],
      option2: json["option2"],
      option3: json["option3"],
      option4: json["option4"],
      answer: json["answer"],
    );
  }
}