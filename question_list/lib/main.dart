import 'package:flutter/material.dart';
import 'package:question_list/model/option.dart';

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
  OptionModel? optionModel;
  List<OptionModel> optionList = [];
  MyHomePage({super.key, required this.title, this.optionModel});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController optionOneController = TextEditingController();
  final TextEditingController optionTwoController = TextEditingController();
  final TextEditingController optionThirdController = TextEditingController();
  final TextEditingController optionFourthController = TextEditingController();
  final TextEditingController optionDescriptionController =
      TextEditingController();
  final TextEditingController questionController = TextEditingController();
  String selectedValue = "Multiple Choice Question";
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text("Multiple Choice Question"),
          value: "Multiple Choice Question"),
      const DropdownMenuItem(
          child: Text("Descriptive Question"), value: "Descriptive Question"),
    ];
    return menuItems;
  }

  void addQueston()  {
    final optionModel = OptionModel(
      question: questionController.text,
      optionOne: optionOneController.text,
      optionTwo: optionTwoController.text,
      optionThree: optionThirdController.text,
      optionFour: optionFourthController.text,
      optionDecr: optionDescriptionController.text,
    );
    setState(() {widget.optionList.add(optionModel);});
    print(widget.optionList.length);
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
              color: Colors.white,
              width: 300,
              child: ListView.builder(
                  itemCount: widget.optionList.length,
                  itemBuilder: (context, index) {
                    final questionDisplay = widget.optionList.elementAt(index);
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlue),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                      child: (selectedValue == "Multiple Choice Question")
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(questionDisplay.question!),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.delete))
                                  ],
                                ),
                                Text(questionDisplay.optionOne!),
                                Text(questionDisplay.optionTwo!),
                                Text(questionDisplay.optionThree!),
                                Text(questionDisplay.optionFour!),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(questionDisplay.question!),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.delete))
                                  ]
                                ),
                                Text(questionDisplay .optionDecr!),
                              ],
                            ),
                    );
                  }),
            ),
            Container(
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
                    child: DropdownButton<String>(
                        value: selectedValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems),
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
                  (selectedValue == "Multiple Choice Question")
                      ? Container(
                          width: 300,
                          child: Column(
                            children: [
                              TextField(
                                controller: optionOneController,
                                decoration:
                                    const InputDecoration(hintText: "Option 1"),
                              ),
                              TextField(
                                controller: optionTwoController,
                                decoration:
                                    const InputDecoration(hintText: "Option 2"),
                              ),
                              TextField(
                                controller: optionThirdController,
                                decoration:
                                    const InputDecoration(hintText: "Option 3"),
                              ),
                              TextField(
                                controller: optionFourthController,
                                decoration:
                                    const InputDecoration(hintText: "Option 4"),
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
                                    hintText: "Description Question"),
                              ),
                            ],
                          ),
                        ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      onPressed: ()  {
                        addQueston();
                        setState(() {});
                      },
                      child: const Text('Add')),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
