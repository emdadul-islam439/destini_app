import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'quiz_info.dart';

void main() {
  runApp(const DestiniApp());
}
class DestiniApp extends StatefulWidget {
  const DestiniApp({Key? key}) : super(key: key);

  @override
  State<DestiniApp> createState() => _DestiniAppState();
}

class _DestiniAppState extends State<DestiniApp> {
  QuizInfo quizInfo = QuizInfo();
  late String questionStatement;
  late List<Icon> resultIconList;

  void settingUpTheState({required bool isCorrectAnswer}){
    quizInfo.modifyTheResultList(isCorrectAnswer: isCorrectAnswer);
    setState((){
      questionStatement = quizInfo.getQuestionText();
      resultIconList = quizInfo.getResultIconList();
    });
  }
  @override
  void initState() {
    questionStatement = quizInfo.getQuestionText();
    resultIconList = quizInfo.getResultIconList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler App',
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 6,
                child: Center(
                  child: Text(
                    questionStatement,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print("YES selected...");
                    }
                    if(quizInfo.getCorrectAnswer() == true){
                      settingUpTheState(isCorrectAnswer: true);
                    }else{
                      settingUpTheState(isCorrectAnswer: false);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Yes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    if (kDebugMode) {
                      print("NO selected...");
                    }
                    if(quizInfo.getCorrectAnswer() == false){
                      settingUpTheState(isCorrectAnswer: true);
                    }else{
                      settingUpTheState(isCorrectAnswer: false);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'No',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                children: resultIconList,
              )
            ],
          ),
        ),
      ),
    );
  }
}

