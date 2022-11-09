import 'dart:async';

import 'package:flutter/material.dart';
import 'package:q_tip/dummy.dart';
import 'package:q_tip/question_model.dart';
import 'package:q_tip/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QTip',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController();
  int _questionIndex = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    //create timer for 5 second to route to next question
    Timer.periodic(const Duration(seconds: 10), (timer) {
      setState(() {
        timer = timer;
      });
      if (_questionIndex == questions.length) {
        timer.cancel();
      } else {
        _handleQ('', '', '');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final List<UserResponse> _pickedOptions = <UserResponse>[];

  void _handleQ(question, correctOption, pickedOption) {
    final UserResponse userResponse = UserResponse(
      questionIndex: _questionIndex,
      questionText: question,
      correctOption: correctOption,
      userPickedOption: pickedOption,
    );
    _pickedOptions.add(userResponse);
    _pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex == questions.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            _pickedOptions,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QTIP'),
      ),
      body: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    timer?.tick.toString() ?? '0',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(question.questionText),
                  InkWell(
                    child: Text(question.optionA),
                    onTap: () {
                      _handleQ(question.questionText, question.correctAnswer,
                          question.optionA);
                    },
                  ),
                  InkWell(
                    child: Text(question.optionB),
                    onTap: () {
                      _handleQ(question.questionText, question.correctAnswer,
                          question.optionB);
                    },
                  ),
                  InkWell(
                    child: Text(question.optionC),
                    onTap: () {
                      _handleQ(question.questionText, question.correctAnswer,
                          question.optionC);
                    },
                  ),
                  InkWell(
                    child: Text(question.optionD),
                    onTap: () {
                      _handleQ(question.questionText, question.correctAnswer,
                          question.optionD);
                    },
                  ),
                ],
              ),
            );
          }),
    );
  }
}
