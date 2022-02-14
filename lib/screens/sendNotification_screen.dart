import 'package:flutter/material.dart';
import 'package:push_notify/services/firebase_manager.dart';
import 'package:push_notify/services/sendNotification.dart';

class SendNotificationScreen extends StatefulWidget {
   SendNotificationScreen({Key? key ,required this.title,required this.listofTokens }) : super(key: key);
    String title="";
    List<String> listofTokens;

  @override
  _SendNotificationScreenState createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text(widget.title) ,),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter some text';
                      }
                    },
                    controller: titleController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Title',
                    ),
                  ),
                  TextFormField(
                    controller: bodyController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter some text';
                      }
                    },
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'body',
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  SendNotificationManager().sendNotification(tokens:widget.listofTokens,title: titleController.value.text,description: bodyController.value.text);
                }
              },
              child: Text("send the notification"))
        ],
      ),
    );
  }
}
