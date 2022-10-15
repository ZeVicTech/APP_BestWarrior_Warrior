// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'User.dart';

class ProfileHeader extends StatelessWidget {
  User user = new User();
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
    return FutureBuilder(
        future: user.setuser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을 때 실행되는 부분
          if (snapshot.hasData == false) {
            return CircularProgressIndicator(); // CircularProgressIndicator : 로딩 에니메이션
          }//에러시
          else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                style: TextStyle(fontSize: 15),
              ),
            );
          }
          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 부분
          else {
            return Column(
              // ignore: prefer_const_literals_to_create_immutables
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  user.username,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  user.userarmy,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  user.userclasses,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            );
          }
        }
    );
  }
}
