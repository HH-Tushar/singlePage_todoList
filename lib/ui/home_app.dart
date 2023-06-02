import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:single_page_todo/models/subject_list_model.dart';
import 'package:single_page_todo/models/subject_model.dart';

// I am writing flutter code maybe 6 months later, So I am leaving this on you guys, If you can't solve then I will solve it tomorrow.
// Good Night. It's already 3:28 here
//ok dont worry we gonna try our best..in sha allah..thnx , welcome, good luck..okh in sha allah sokl e solve kore code die rakhbo ...ok

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

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
          context.read<SubjectListModel>().addSubject(SubjectModel()
            ..addTopic("Topic 1")
            ..addTopic('Topic 2'));
        },
      ),
      // you may use this to add new subject
    );
  }
}

class SubjectWidget extends StatefulWidget {
  const SubjectWidget(
      {super.key, required this.subject, required this.onDelete});
  final VoidCallback onDelete;
  final SubjectModel subject;

  @override
  State<SubjectWidget> createState() => _SubjectWidgetState();
}

class _SubjectWidgetState extends State<SubjectWidget> {
  @override
  Widget build(BuildContext context) {
    // also subject title editing will be handle here
    return Card(
      child: Provider<SubjectModel>.value(
        value: widget.subject,
        builder: (context, _) => Column(
          children: [
            for (var topic in context.watch<SubjectModel>().topics)
              Text(topic) ,
              Text("data")// TopicView will be used here
          ],
        ),
      ),
    );
  }
}

class TopicView extends StatefulWidget {
  const TopicView({super.key});

  @override
  State<TopicView> createState() => _TopicViewState();
}

class _TopicViewState extends State<TopicView> {
  @override
  Widget build(BuildContext context) {
    // you should handle delete and edit topic functionality here
    return const Placeholder();
  }
}
