import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:push_notify/model/user.dart';

class FirebaseManager {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseMessaging _message = FirebaseMessaging.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  anonRegister() async {
    await _auth.signInAnonymously();
    saveUserToken();
  }

  isRegistered() {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        anonRegister();

        print('User is Registered...');
      } else {
        print('User is signed in!');
      }
    });
  }

  saveUserToken() async {
    final uid = _auth.currentUser!.uid;
    final userToken = await _message.getToken();
    final thisUser = ThisUser(uid: uid, token: userToken);

    _fireStore
        .collection("users")
        .doc(uid)
        .set(thisUser.toMap(), SetOptions(merge: true));
  }

  static Future<List<ThisUser>> getToken() async {
    var snapshot = await FirebaseFirestore.instance.collection("users").get();
    List<ThisUser> listofUsers = [];
    snapshot.docs.forEach((element) {
      ThisUser user = ThisUser.fromMap(element.data());

      listofUsers.add(user);
    });

    return listofUsers;
  }
}
