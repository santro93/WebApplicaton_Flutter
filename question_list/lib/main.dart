import 'package:flutter/material.dart';
import 'package:question_list/model/question.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Question> optionList = [
    MultipleChoice(
      question: "question",
      optionOne: "1",
      optionTwo: "2",
      optionThree: "3",
      optionFour: "4",
    ),
    Descriptive(question: "2222222222", description: "description")
  ];
  final TextEditingController optionOneController = TextEditingController();
  final TextEditingController optionTwoController = TextEditingController();
  final TextEditingController optionThirdController = TextEditingController();
  final TextEditingController optionFourthController = TextEditingController();
  final TextEditingController optionDescriptionController =
      TextEditingController();
  final TextEditingController questionController = TextEditingController();
  QuestionType questionType = QuestionType.MULTIPLE_CHOICE;
  List<DropdownMenuItem<QuestionType>> get dropdownItems {
    List<DropdownMenuItem<QuestionType>> menuItems = [
      const DropdownMenuItem<QuestionType>(
        child: Text("Multiple Choice Question"),
        value: QuestionType.MULTIPLE_CHOICE,
      ),
      const DropdownMenuItem(
        child: Text("Descriptive Question"),
        value: QuestionType.DESCRIPTION,
      ),
    ];
    return menuItems;
  }

  void addQueston() {
    switch (questionType) {
      case QuestionType.MULTIPLE_CHOICE:
        final question = MultipleChoice(
          question: questionController.text,
          optionOne: optionOneController.text,
          optionTwo: optionTwoController.text,
          optionThree: optionThirdController.text,
          optionFour: optionFourthController.text,
        );

        setState(() {
          optionList.add(question);
        });
        break;
      case QuestionType.DESCRIPTION:
        final question = Descriptive(
            question: questionController.text,
            description: optionDescriptionController.text);
        setState(() {
          optionList.add(question);
        });
        break;
    }

    print(optionList.length);
    questionController.clear();
    optionOneController.clear();
    optionTwoController.clear();
    optionThirdController.clear();
    optionFourthController.clear();
    questionController.clear();
    optionDescriptionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    print("build method");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: optionList.length,
                    itemBuilder: (context, index) {
                      print("inside listview $index ");
                      final questionDisplay = optionList.elementAt(index);
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.lightBlue),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: (questionDisplay is MultipleChoice)
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(questionDisplay.question),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.delete))
                                    ],
                                  ),
                                  Text(questionDisplay.optionOne),
                                  Text(questionDisplay.optionTwo),
                                  Text(questionDisplay.optionThree),
                                  Text(questionDisplay.optionFour),
                                ],
                              )
                            : (questionDisplay is Descriptive)
                                ? Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(questionDisplay.question),
                                            IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.delete))
                                          ]),
                                      Text(questionDisplay.description),
                                    ],
                                  )
                                : const Text("data"),
                      );
                    }),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Add Question '),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete))
                      ],
                    ),
                    const Text('Type:'),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      width: 300,
                      child: DropdownButton<QuestionType>(
                        value: questionType,
                        onChanged: (QuestionType? newQuestionType) {
                          setState(() {
                            questionType = newQuestionType!;
                          });
                        },
                        items: dropdownItems,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        controller: questionController,
                        decoration:
                            const InputDecoration(hintText: "Write Question"),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    (questionType == QuestionType.MULTIPLE_CHOICE)
                        ? Container(
                            width: 300,
                            child: Column(
                              children: [
                                TextField(
                                  controller: optionOneController,
                                  decoration: const InputDecoration(
                                      hintText: "Option 1"),
                                ),
                                TextField(
                                  controller: optionTwoController,
                                  decoration: const InputDecoration(
                                      hintText: "Option 2"),
                                ),
                                TextField(
                                  controller: optionThirdController,
                                  decoration: const InputDecoration(
                                      hintText: "Option 3"),
                                ),
                                TextField(
                                  controller: optionFourthController,
                                  decoration: const InputDecoration(
                                      hintText: "Option 4"),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            width: 300,
                            child: Column(
                              children: [
                                TextField(
                                  controller: optionDescriptionController,
                                  decoration: const InputDecoration(
                                    hintText: "Description Question",
                                  ),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          addQueston();
                        },
                        child: const Text('Add')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
