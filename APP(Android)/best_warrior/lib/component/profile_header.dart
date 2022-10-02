// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_buildHeaderProfile()],
    );
  }

  Widget _buildHeaderAvatar() {
    return SizedBox();
  }

  Widget _buildHeaderProfile() {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          '이정호',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        Text(
          '2탄약중대/상병',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          '특기: 체력',
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}
