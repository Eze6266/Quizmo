// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quizzmo/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: prefer_const_constructors
void main() => runApp(Quizzmo());

class Quizzmo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: QuizzmoPage(),
          ),
        ),
      ),
    );
  }
}

class QuizzmoPage extends StatefulWidget {
  @override
  _QuizzmoPageState createState() => _QuizzmoPageState();
}

class _QuizzmoPageState extends State<QuizzmoPage> {
  void checkAnswer(bool userPickedAnswer) {
    bool? correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  //   bool? correctAnswers = quizBrain.getCorrectAnswer();
  //   setState(() {
  //     if (correctAnswers == true) {
  //       scoreKeeper.add(
  //         Icon(
  //           Icons.check,
  //           color: Colors.green,
  //         ),
  //       );
  //       print('user got it right');
  //     } else {
  //       scoreKeeper.add(
  //         Icon(
  //           Icons.close,
  //           color: Colors.red,
  //         ),
  //       );
  //       print('user got it wrong');
  //     }

  //     quizBrain.nextQuestion();
  //   });
  // }

  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  // List<bool> answers = [
  //   false,
  //   true,
  //   true,
  // ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(
                15.0,
              ),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  'TRUE',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(
                15.0,
              ),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  'FALSE',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
