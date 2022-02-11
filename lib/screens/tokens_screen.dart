import 'package:flutter/material.dart';
import 'package:push_notify/services/firebase_manager.dart';

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
    );
  }
}
