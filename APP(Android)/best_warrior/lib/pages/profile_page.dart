import 'package:best_warrior/component/profile_grade_info.dart';
import 'package:best_warrior/component/profile_tab.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../component/profile_header.dart';
import '../component/User.dart';
import 'package:best_warrior/component/auth.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Text('정말 로그아웃 하시겠습니까?'),
                      insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
                      actions: [
                        TextButton(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: const Text('확인'),
                          onPressed: () {
                            signOut(); //로그아웃
                          },
                        ),
                      ],
                    );
                  });
            },
            color: Color.fromARGB(255, 255, 255, 255),
            icon: Icon(Icons.logout)),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ProfileHeader(),
          SizedBox(height: 20),
          profileGradeInfo(),
          SizedBox(height: 20),
          Expanded(child: ProfileTab()),
        ],
      ),
    );
  }

  Future<void> signOut() async {
    await Auth().signOut();
  }
}
