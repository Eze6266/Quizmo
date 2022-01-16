import 'package:quizzmo/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionsBank = [
    Question('You can lead a cow downstairs but not upstairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionsBank.length - 1) {
      _questionNumber++;
    }
  }

  String? getQuestionText() {
    return _questionsBank[_questionNumber].questionText;
  }

  bool? getCorrectAnswer() {
    return _questionsBank[_questionNumber].questionAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionsBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
