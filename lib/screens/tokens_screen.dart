import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:push_notify/model/user.dart';
import 'package:push_notify/services/firebase_manager.dart';
import 'dart:convert';

class TokensScreen extends StatefulWidget {
  const TokensScreen({Key? key}) : super(key: key);

  @override
  _TokensScreenState createState() => _TokensScreenState();
}

class _TokensScreenState extends State<TokensScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder<List<ThisUser>>(
            future: FirebaseManager.getToken(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  ThisUser t = snapshot.data![index];
                  return tokenCard(t.token);
                  // getExpenseItems(snapshot);
                },
              );
            }));
  }

  Widget tokenCard(snapshot) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            print(snapshot);
          },
          child: const Text(
            "token",
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
