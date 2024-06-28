import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var _activeScreen = 'home-page';
  List<String> _selectedAnswers = [];

  // @override
  // void initState() {
  //   _activeScreen = HomePage(swithScreen);
  //   super.initState();
  // }

  void switchScreenToQuestions() {
    setState(() {
      _activeScreen = 'questions';
      debugPrint('Quiz has been started');
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
        debugPrint('Quiz has been completed');
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      _activeScreen = 'home-page';
      debugPrint('Quiz has been restarted');
    });
  }

  @override
  Widget build(BuildContext context) {
    // var screenWidget = _activeScreen == 'start-screen'
    //     ? HomePage(switchScreenToQuestions)
    //     : const QuestionsScreen();

    Widget screenWidget = HomePage(switchScreenToQuestions);

    if (_activeScreen == 'questions') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 187, 45, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
