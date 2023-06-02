import 'dart:collection';

import 'package:flutter/foundation.dart';

class SubjectModel with ChangeNotifier {
  SubjectModel();
  final List<String> _topics = [];

  List<String> get topics => UnmodifiableListView(_topics);

  void addTopic(String value) {
    _topics.add(value);
    notifyListeners();
  }

  void removeTopic(String value) {
    _topics.remove(value);
    notifyListeners();
  }

  // function to convert data into text, so that we can store in memory
  Map<String, dynamic> toJSON() {
    return {'topics': _topics};
  }

  // make object from data,
  SubjectModel.fromJSON(Map<String, dynamic> map) {
    for (var element in (map['topics'] as List)) {
      _topics.add(element as String);
    }
  }
}
