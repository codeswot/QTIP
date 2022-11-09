class Question {
  final String questionText;
  final String optionA;
  final String optionB;
  final String optionC;
  final String optionD;

  final String correctAnswer;

  const Question({
    required this.questionText,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
    required this.correctAnswer,
  });
}

class UserResponse {
  final String questionText;
  final int questionIndex;
  final String correctOption;
  final String userPickedOption;

  const UserResponse({
    required this.questionIndex,
    required this.questionText,
    required this.correctOption,
    required this.userPickedOption,
  });
}
