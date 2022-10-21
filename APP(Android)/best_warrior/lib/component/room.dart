import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Room extends StatelessWidget {
  const Room({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.green,
      margin: EdgeInsets.all(10),
      height: 60,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '방 제목',
          style: TextStyle(fontSize: 30),
        ),
        Row(
          children: [
            Text('병기본 과목 이름', style: TextStyle(fontSize: 15)),
            _buildLine(),
            Text('멘토 이름', style: TextStyle(fontSize: 15)),
          ],
        ),
      ]),
    );
  }

  Widget _buildLine() {
    return Container(
      color: Colors.black,
      width: 1,
      height: 15,
    );
  }
}
