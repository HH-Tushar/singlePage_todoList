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
          context
              .read<SubjectListModel>()
              .addSubject(SubjectModel()..create());
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
  final MySubjectListModel subject;

  @override
  State<SubjectWidget> createState() => _SubjectWidgetState();
}

class _SubjectWidgetState extends State<SubjectWidget> {

  List<Topic> tempo=[];

  @override
  Widget build(BuildContext context) {
    // also subject title editing will be handle here
    return Card(
      child: Provider<SubjectModel>.value(
        value: widget.subject.model,
        builder: (context, _) => Column(
          children: [
            Text("Subject Name${widget.subject.title}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("topics:"),
                const SizedBox(width: 50),
                MaterialButton(
                  minWidth: 15,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),color: Colors.black12,elevation: 10,
                    onPressed: (){
                   //need more work
                  widget.subject.model.addTopic("");
                    }, child:const Icon(Icons.playlist_add)),],),

             for (var item in context.watch<SubjectModel>().topics)
               Text(item.topic.toString()),

            // TopicView will be used here
          ],
        ),
      ),
    );
  }
}


