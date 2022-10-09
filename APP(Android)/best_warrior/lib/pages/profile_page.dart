import 'package:best_warrior/component/profile_grade_info.dart';
import 'package:best_warrior/component/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../component/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
            ProfileHeader(),
            SizedBox(height: 20),
            profileGradeInfo(),
            SizedBox(height: 20),
            Expanded(child:ProfileTab()),
        ],
      ),
    );
  }
}
