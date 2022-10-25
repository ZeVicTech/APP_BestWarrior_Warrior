import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Room extends StatelessWidget {
  String _name = '방 제목';
  String _subject = '병기본 과목 이름';
  String _mentor = '멘토 이름';
  int subjectCode;
  Room(this._name,this._subject,this._mentor,this.subjectCode);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      color: Colors.green,
      margin: EdgeInsets.all(10),
      height: 60,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          _name,
          style: TextStyle(fontSize: 30),
        ),
        Row(
          children: [
            Text(_subject, style: TextStyle(fontSize: 15)),
            _buildLine(),
            Text(_mentor, style: TextStyle(fontSize: 15)),
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
