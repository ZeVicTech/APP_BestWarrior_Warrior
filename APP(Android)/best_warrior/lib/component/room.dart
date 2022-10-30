import 'package:best_warrior/pages/meetingroom_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:best_warrior/component/meetinginfo.dart';
import 'dart:math';

class Room extends StatelessWidget {
  String _name = '방 제목';
  String _subject = '병기본 과목 이름';
  String _mentor = '멘토 이름';
  int num=Random().nextInt(100) + 1;
  int subjectCode;
  String introduce ='소개글';
  Room(this._name, this._subject, this._mentor, this.subjectCode, this.introduce);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: setColor(),
          border: Border.all(
            width: 3,
            color: setColor(),
          ),
        ),
        margin: EdgeInsets.all(7),
        padding: EdgeInsets.all(3),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Text("과목:"+_subject,
                      style: TextStyle(
                        fontSize: 15,
                        //color: Colors.white,
                        color: Colors.black,
                      )),
                  SizedBox(
                    width: 3,
                  ),
                  _buildLine(),
                  SizedBox(
                    width: 3,
                  ),
                  Text("멘토:"+_mentor,
                      style: TextStyle(
                        fontSize: 15,
                        //color: Colors.white,
                        color: Colors.black,
                      )),
                ],
              ),
            ]),
            SizedBox(width: 30),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Meet_Header(this._name,this._mentor,this.introduce).mentorinfo(this._mentor,this.num,this.introduce),
                          insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
                          actions: [
                            TextButton(
                              child: const Text('확인'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
                icon: Icon(Icons.face))
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MeetingroomPage(this._name,this._mentor,this.introduce)),
        );
      },
    );
  }

  Color setColor() {
    switch (subjectCode) {
      case 0:
        return Colors.black;
      case 1:
        return Colors.green;
      case 2:
        return Colors.blueGrey;
      case 3:
        return Colors.deepOrange;
      case 4:
        return Colors.cyan;
      case 5:
        return Colors.yellow;
      case 6:
        return Colors.purple;
      default:
        return Colors.green;
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
