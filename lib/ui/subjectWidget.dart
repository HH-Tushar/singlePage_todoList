
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/subject_list_model.dart';
import '../models/subject_model.dart';

class SubjectWidget extends StatefulWidget {
  const SubjectWidget(
      {super.key,
        required this.subject,
        required this.onDelete,
      });

  final VoidCallback onDelete;
  final MySubjectListModel subject;


  @override
  State<SubjectWidget> createState() => _SubjectWidgetState();
}

class _SubjectWidgetState extends State<SubjectWidget> {

  TextEditingController subTitleController = TextEditingController();
  TextEditingController topicTitleController = TextEditingController();

  //Functions:
 void createTopicTemplate(){
   widget.subject.model.create();
   setState(() {
   });
 }

 void editTopic({required String topicTitle,required Topic item}){
   widget.subject.model.addTopic(topicTitle);
   deleteTopic(item: item);
   topicTitleController.clear();
   //topicTitleController.dispose();
   setState(() {
   });
 }

 void deleteTopic({required Topic item}){
   widget.subject.model.removeTopic(value: item);
   setState(() {
   });
 }

  @override
  Widget build(BuildContext context) {

    var topicList = widget.subject.model.topics;

    return Card(
      margin: const EdgeInsets.all(10),
      child: Provider<SubjectModel>.value(
        value: widget.subject.model,
        builder: (context, child) => widget.subject.title == null
            ? Padding(
          padding:const EdgeInsets.all(15),
          child: Row(
            children: [
              const Text("Subject Title: "),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(isCollapsed: true,border: InputBorder.none),
                  enabled: true,
                  textAlign: TextAlign.start,
                  controller: subTitleController,
                  autofocus: true,
                  textAlignVertical: TextAlignVertical.center,
                ),
              ),
              IconButton(
                  onPressed: () {
                    context.read<SubjectListModel>().editSubject(
                        SubjectModel()
                          ..addTopic(subTitleController.value.text),
                        subTitleController.value.text.toString());
                    widget.onDelete();
                    subTitleController.clear();
                    subTitleController.dispose();
                  },
                  icon: const Icon(Icons.done))
            ],
          ),
        )
            : Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Subject Name : ${widget.subject.title}"),
                  MaterialButton(
                      minWidth: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.black12,
                      elevation: 10,
                      onPressed: () {
                        //calling Topic template
                        createTopicTemplate();

                      },
                      child: const Icon(Icons.playlist_add)),
                  MaterialButton(
                      minWidth: 15,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.black12,
                      elevation: 10,
                      onPressed: () {
                        widget.onDelete();
                      },
                      child: const Icon(Icons.delete_rounded)),
                ],
              ),
              if(topicList.isNotEmpty)
                const Text("topics:"),


              // Consumer<SubjectModel>(builder: (context,topic,child)=>Text(topic.topics.topic.toString())),
              for (var item in topicList)
                item.topic==null?
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(isCollapsed: true,border: InputBorder.none),
                        enabled: true,
                        textAlign: TextAlign.start,
                        controller: topicTitleController,
                        autofocus: true,
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),

                    IconButton(
                        onPressed: () {
                          //calling edit function
                          editTopic(
                              item:item,
                              topicTitle: topicTitleController.value.text
                          );

                        },
                        icon: const Icon(Icons.done))
                  ],
                )
                    :
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.topic.toString()),
                    MaterialButton(
                        minWidth: 15,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.black12,
                        elevation: 10,
                        onPressed: () {
                          //calling delete function to delete specific one
                          deleteTopic(item: item);

                        },
                        child: const Icon(Icons.delete_rounded)),
                  ],
                ),

              // TopicView will be used here
            ],
          ),
        ),
      ),
    );
  }
}