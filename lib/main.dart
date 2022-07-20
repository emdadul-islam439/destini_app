import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'story_info.dart';

void main() {
  runApp(const DestiniApp());
}
class DestiniApp extends StatefulWidget {
  const DestiniApp({Key? key}) : super(key: key);

  @override
  State<DestiniApp> createState() => _DestiniAppState();
}

class _DestiniAppState extends State<DestiniApp> {
  StoryInfo storyInfo = StoryInfo();
  late String storyStatement;
  late String positiveOutcome;
  late String negativeOutcome;

  void settingUpTheState({required bool isCorrectAnswer}){
    setState((){
      storyStatement = storyInfo.getQuestionText();
      positiveOutcome = storyInfo.getPositiveOutcome();
      negativeOutcome = storyInfo.getNegativeOutcome();
    });
  }
  @override
  void initState() {
    storyStatement = storyInfo.getQuestionText();
    positiveOutcome = storyInfo.getPositiveOutcome();
    negativeOutcome = storyInfo.getNegativeOutcome();
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
                    storyStatement,
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
                    if(storyInfo.getPositiveOutcome() == true){
                      settingUpTheState(isCorrectAnswer: true);
                    }else{
                      settingUpTheState(isCorrectAnswer: false);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text(
                    positiveOutcome,
                    style: const TextStyle(
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
                    if(storyInfo.getPositiveOutcome() == false){
                      settingUpTheState(isCorrectAnswer: true);
                    }else{
                      settingUpTheState(isCorrectAnswer: false);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Text(
                    negativeOutcome,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

