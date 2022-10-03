import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class profileGradeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfo('주특기', '특급'),
        _buildLine(),
        _buildInfo('화생방', '특급'),
        _buildLine(),
        _buildInfo('경계', '특급'),
        _buildLine(),
        _buildInfo('정신전력', '특급'),
        _buildLine(),
        _buildInfo('개인화기', '특급'),
        _buildLine(),
        _buildInfo('체력', '특급'),
      ],
    );
  }

  Widget _buildInfo(String title, String grade) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: 2),
        Text(
          grade,
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }

  Widget _buildLine() {
    return Container(
      color: Colors.black,
      width: 2,
      height: 50,
    );
  }
}
