import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Room extends StatelessWidget {
  String _name = '방 제목';
  String _subject = '병기본 과목 이름';
  String _mentor = '멘토 이름';
  int subjectCode;
  Room(this._name, this._subject, this._mentor, this.subjectCode);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: setColor(),
        border: Border.all(
          width: 3,
          color: setColor(),
        ),
      ),
      margin: EdgeInsets.all(7),
      height: 70,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          _name,
          style: TextStyle(
            fontSize: 30,
            //color: Colors.white,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            Text(_subject,
                style: TextStyle(
                  fontSize: 15,
                  //color: Colors.white,
                  color: Colors.black,
                )),
            _buildLine(),
            Text(_mentor,
                style: TextStyle(
                  fontSize: 15,
                  //color: Colors.white,
                  color: Colors.black,
                )),
          ],
        ),
      ]),
    );
  }

  Color setColor() {
    switch (subjectCode) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.blueGrey;
      case 2:
        return Colors.deepOrange;
      case 3:
        return Colors.cyan;
      case 4:
        return Colors.yellow;
      case 5:
        return Color.fromARGB(255, 238, 30, 186);
      default:
        return Color.fromARGB(255, 231, 24, 24);
    }
  }

  Widget _buildLine() {
    return Container(
      //color: Colors.white,
      color: Colors.black,
      width: 1,
      height: 15,
    );
  }
}
