

import 'package:flutter/foundation.dart';
import 'package:single_page_todo/models/subject_model.dart';

class SubjectListModel with ChangeNotifier {
   SubjectListModel();
  

   List<MySubjectListModel> _subjects = [];

  //List<SubjectModel> get subjects => UnmodifiableListView(_subjects as Iterable<SubjectModel>);
  List<MySubjectListModel> get subjects{
    return _subjects;
  }

   void create(SubjectModel model) {
     _subjects.add(MySubjectListModel(model:model ));
     notifyListeners();
   }

  void editSubject(SubjectModel model,String title) {
    _subjects.add(MySubjectListModel(model:model ,title: title));
    notifyListeners();
  }

  void removeSubject( MySubjectListModel model) {
    _subjects.remove(model);
    notifyListeners();
  }

  //implement those later
}


class MySubjectListModel{
   String ?title;
  SubjectModel model;

  MySubjectListModel({  this.title, required this.model});
}