import 'package:flutter/material.dart';
import 'story.dart';

class StoryInfo {
  //region main properties
  bool _isStoryListNotOver() {
    return _currentStoryIdx < _storyList.length - 1;
  }

  //endregion

  //region question-answer related
  final List<Story> _storyList = [
    Story(
      story: 'Lorem ipsum dolor sit amet?',
      positiveOutcome: 'Lorem ipsum',
      negativeOutcome: 'dolor sit amet',
    ),
    Story(
        story:
            'Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua?',
        positiveOutcome: 'Consectetur adipiscing elit',
        negativeOutcome: 'sed do eiusmod tempor incididunt ut labore'),
    Story(
      story: 'Ut enim ad minim veniam?',
      positiveOutcome: 'Ut enim ad',
      negativeOutcome: 'minim veniam',
    ),
    Story(
      story:
          'Quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat?',
      positiveOutcome:
          'Quis nostrud exercitation ullamco laboris nisi ut aliquip',
      negativeOutcome: 'ea commodo consequat',
    ),
    Story(
      story: 'Duis aute irure dolor?',
      positiveOutcome: 'Duis aute irure',
      negativeOutcome: 'dolor',
    ),
    Story(
      story:
          'In reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur?',
      positiveOutcome: 'In reprehenderit in voluptate velit',
      negativeOutcome: 'velit esse cillum dolore eu fugiat nulla pariatur',
    ),
    Story(
      story:
          'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum?',
      positiveOutcome: 'Excepteur sint occaecat cupidatat non proident',
      negativeOutcome: 'sunt in culpa qui officia deserunt mollit anim id est laborum',
    ),
  ];

  int _currentStoryIdx = 0;

  String getStoryText() {
    String story = _storyList[_currentStoryIdx].story;
    if (_isStoryListNotOver()) {
      _currentStoryIdx++;
    }
    return story;
  }
  String getPositiveOutcome() {
    return _storyList[_currentStoryIdx].positiveOutcome;
  }
  String getNegativeOutcome() {
    return _storyList[_currentStoryIdx].negativeOutcome;
  }

  bool isStoriesFinished(){
    return _currentStoryIdx == _storyList.length-1;
  }

  void reStartAll(){
    _currentStoryIdx = 0;
  }
  //endregion
}
