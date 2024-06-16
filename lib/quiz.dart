import 'package:flutter/material.dart';
import 'package:quiz_app_trial5/question_screen.dart';
import 'package:quiz_app_trial5/questions.dart';
import 'package:quiz_app_trial5/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;
  @override
  void initState() {
    // TODO: implement initState
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    });
  }

  void chooseAnswer(String selAnswer) {
    selectedAnswers.add(selAnswer);
    if (selectedAnswers.length == questions.length) {
      // selectedAnswers = [];
      setState(() {
        selectedAnswers = [];
        activeScreen = StartScreen(switchScreen);
      });
    }
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.yellow,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
