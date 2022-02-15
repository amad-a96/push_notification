import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:push_notify/screens/MyScreen.dart';
import 'package:push_notify/screens/tokens_screen.dart';
import 'package:push_notify/services/firebase_manager.dart';
import 'package:push_notify/services/local_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseManager().isRegistered();
  //await FirebaseAuth.instance.signOut();
  await NotificationService().initNotification();

  // var a = FirebaseManager().gett();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const TokensScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/MyScreen': (context) => const Myscreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
