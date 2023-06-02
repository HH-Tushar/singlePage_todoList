import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:single_page_todo/models/subject_model.dart';

class SubjectListModel with ChangeNotifier {
  SubjectListModel();

  final List<SubjectModel> _subjects = [];

  List<SubjectModel> get subjects => UnmodifiableListView(_subjects);

  void addSubject(SubjectModel model) {
    _subjects.add(model);
    notifyListeners();
  }

  void removeSubject(model) {
    _subjects.remove(model);
    notifyListeners();
  }

  //implement those later
}
