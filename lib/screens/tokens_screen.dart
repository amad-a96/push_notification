import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:push_notify/model/user.dart';
import 'package:push_notify/screens/sendNotification_screen.dart';
import 'package:push_notify/services/firebase_manager.dart';
import 'dart:convert';

import 'package:push_notify/services/local_notification.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class TokensScreen extends StatefulWidget {
  const TokensScreen({Key? key}) : super(key: key);

  @override
  _TokensScreenState createState() => _TokensScreenState();
}

class _TokensScreenState extends State<TokensScreen> {
  @override
  void initState() {
    tz.initializeTimeZones();
    super.initState();
  }

  List<String> listofTokens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: () => NotificationService()
                    .showNotification(1, 'title', ' body', 5),
                child: Text("send notif in 5 second")),
            ElevatedButton(
                onPressed: () => NotificationService()
                    .showNotification(2, 'title', ' body', 1),
                child: Text("send notif now"))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<ThisUser>>(
                  future: FirebaseManager.getToken(),
                  builder: (BuildContext context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    }

                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        ThisUser t = snapshot.data![index];
                        listofTokens.add(t.token.toString());
                        return tokenCard(listofTokens[index]);
                        // getExpenseItems(snapshot);
                      },
                    );
                  }),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SendNotificationScreen(
                        title: "send notification to all",
                        listofTokens: listofTokens,
                      );
                    },
                  ));
                },
                child: Text("send notification"))
          ],
        ));
  }

  Widget tokenCard(snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            final List<String> token = [];
            token.add(snapshot);
            print(token);
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return SendNotificationScreen(
                  title: "send notification to specific device",
                  listofTokens:token,
                );
              },
            ));
          },
          child: const Text(
            "token",
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
