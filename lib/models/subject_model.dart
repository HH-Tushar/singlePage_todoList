import 'dart:collection';

import 'package:flutter/foundation.dart';

class SubjectModel with ChangeNotifier {
   SubjectModel();
  final List<Topic> _topics = [];

  //List<String> get topics => UnmodifiableListView(_topics);
  List<Topic> get topics{return _topics;}


  void create() {
    _topics.add(Topic());
    notifyListeners();
  }
  void addTopic(String value) {
    _topics.add(Topic(topic: value));
    notifyListeners();
  }

  void removeTopic(String value) {
    _topics.removeWhere((element) => element.topic==value);
    notifyListeners();
  }

  // function to convert data into text, so that we can store in memory
  Map<String, dynamic> toJSON() {
    return {'topics': _topics};
  }

  // make object from data,
  SubjectModel.fromJSON(Map<String, dynamic> map) {
    for (var element in (map['topics'] as List)) {
      _topics.add(element as Topic);
    }
  }
}

class Topic{
  String? topic;
  Topic({this.topic});
}
