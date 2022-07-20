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
  bool isReStartingNeeded = false;

  void settingUpTheState() {
    setState(() {
      if(isReStartingNeeded){
        storyInfo.reStartAll();
        isReStartingNeeded = false;
      }
      _initializeAll();
    });
  }

  @override
  void initState() {
    _initializeAll();
    super.initState();
  }

  void _initializeAll(){
    storyStatement = storyInfo.getStoryText();
    positiveOutcome = storyInfo.getPositiveOutcome();
    negativeOutcome = storyInfo.getNegativeOutcome();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzler App',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 7,
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
                  flex: storyInfo.isStoriesFinished() ? 0 : 1,
                  child: storyInfo.isStoriesFinished()
                      ? const SizedBox()
                      : TextButton(
                          onPressed: () {
                            settingUpTheState();
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
                      if(storyInfo.isStoriesFinished()){
                        isReStartingNeeded = true;
                      }
                      settingUpTheState();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      storyInfo.isStoriesFinished() ? 'Restart' : negativeOutcome,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontFamily: 'Source Sans Pro',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: storyInfo.isStoriesFinished() ? 1 : 0,
                  child: const SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
