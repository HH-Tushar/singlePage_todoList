import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_page_todo/models/subject_list_model.dart';
import 'package:single_page_todo/models/subject_model.dart';
import 'package:single_page_todo/ui/subjectWidget.dart';

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

//   @override
//   State<HomeApp> createState() => _HomeAppState();
// }
//
// class _HomeAppState extends State<HomeApp> {

  @override
  Widget build(BuildContext context) {
    var list = context.watch<SubjectListModel>().subjects;
    return Scaffold(
      body: ListView.builder(
       itemCount: list.length,
       itemBuilder: (context, i) => SubjectWidget(
         subject: list[i],
         onDelete: () {
           context.read<SubjectListModel>().removeSubject(list[i]);
         },
       ),
        ),
      //
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SubjectListModel>().create(SubjectModel()..create());
        },
        child: const Icon(Icons.add),
      ),

      // you may use this to add new subject
    );
  }
}

