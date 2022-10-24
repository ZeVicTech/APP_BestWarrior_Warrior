import 'package:best_warrior/component/auth.dart';
import 'package:best_warrior/pages/home_page.dart';
import 'package:best_warrior/pages/login_page.dart';
import 'package:best_warrior/pages/main_page.dart';
import 'package:best_warrior/pages/meetingroom_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) { 
          return MeetingroomPage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}