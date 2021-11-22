class TriviaModel {
  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAnswer;

  TriviaModel(this.category, this.type, this.difficulty, this.question,
      this.correctAnswer);

  TriviaModel.fromJson(Map<String, dynamic> json)
      : category = json["category"],
        type = json["type"],
        difficulty = json["difficulty"],
        question = json["question"],
        correctAnswer = json["correct_answer"];
}
