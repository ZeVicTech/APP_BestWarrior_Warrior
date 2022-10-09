import 'package:best_warrior/component/auth.dart';
import 'package:best_warrior/home_page.dart';
import 'package:best_warrior/login_page.dart';
import 'package:flutter/material.dart';
import 'package:best_warrior/profile_page.dart';

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
          return ProfilePage();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}