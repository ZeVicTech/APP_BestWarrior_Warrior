// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfileHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        _buildHeaderAvatar(),
        SizedBox(width: 20),
        _buildHeaderProfile(),
      ],
    );
  }

  Widget _buildHeaderAvatar() {
    return SizedBox(
        width: 100,
        height: 100,
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/soldier.jpg"),
        ));
  }



  Widget _buildHeaderProfile() {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '2탄약중대/상병',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '2탄약중대/상병',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '특기: 체력',
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}