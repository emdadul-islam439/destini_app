import 'package:flutter/material.dart';
import 'question.dart';

class QuizInfo{
  //region main properties
  bool _isQuestionListNotOver(){
    return _currentQuestionIdx <= _questionBank.length - 1;
  }
  //endregion

  //region question-answer related
  final List<Question> _questionBank = [
    Question(question: 'Lorem ipsum dolor sit amet?', answer: true),
    Question(question: 'Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua?', answer: false,),
    Question(question: 'Ut enim ad minim veniam?', answer: false),
    Question(question: 'Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat?', answer: true),
    Question(question: 'Duis aute irure dolor?', answer: true),
    Question(question: 'In reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur?', answer: true),
    Question(question: 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum?', answer: false),
  ];

  int _currentQuestionIdx = 0;
  String getQuestionText(){
    String questionStatement = _questionBank[_currentQuestionIdx].question;
    if(_isQuestionListNotOver()){
      _currentQuestionIdx++;
    }
    return questionStatement;
  }
  bool getCorrectAnswer(){
    return _questionBank[_currentQuestionIdx].answer;
  }
  //endregion

  //region result related
  List<Icon> _resultIconsList = [];
  void _addCorrectIcon() {
    if(_isQuestionListNotOver()){
      _resultIconsList.add(const Icon(Icons.check, color: Colors.green));
    }
  }
  void _addWrongIcon() {
    if(_isQuestionListNotOver()) {
      _resultIconsList.add(const Icon(Icons.clear, color: Colors.red));
    }
  }
  void modifyTheResultList({required bool isCorrectAnswer}){
    if(isCorrectAnswer) {
      _addCorrectIcon();
    } else {
      _addWrongIcon();
    }
  }
  List<Icon> getResultIconList(){
    return _resultIconsList;
  }
  //endregion
}