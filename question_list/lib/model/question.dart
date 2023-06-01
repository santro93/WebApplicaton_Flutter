enum QuestionType { MULTIPLE_CHOICE, DESCRIPTION }

class Question {
  String question;
  Question({
    required this.question,
  });
}

class Descriptive extends Question {
  final String description;

  Descriptive({
    required this.description,
    required super.question,
  });
}

class MultipleChoice extends Question {
  final String optionOne;
  final String optionTwo;
  final String optionThree;
  final String optionFour;
  MultipleChoice({
    required super.question,
    required this.optionOne,
    required this.optionTwo,
    required this.optionThree,
    required this.optionFour,
  });
}
