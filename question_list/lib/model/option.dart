class OptionModel {
  String? question;
  String? optionOne;
  String? optionTwo;
  String? optionThree;
  String? optionFour;
  String? optionDecr;

  OptionModel(
      {required this.question,
      required this.optionOne,
      required this.optionTwo,
      required this.optionThree,
      required this.optionFour,
      required this.optionDecr});

  Map<String, dynamic> toJson() => {
        'question': question,
        'optionOne': optionOne,
        'optionTwo': optionTwo,
        'optionThree': optionThree,
        'optionFour': optionFour,
        'optionDecr': optionDecr,
      };

  OptionModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    optionOne = json['optionOne'];
    optionTwo = json['optionTwo'];
    optionThree = json['optionThree'];
    optionFour = json['optionFour'];
    optionDecr = json['optionDecr'];
  }
}
