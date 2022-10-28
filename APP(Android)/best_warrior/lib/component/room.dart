import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:best_warrior/component/meetinginfo.dart';

class Room extends StatelessWidget {
  String _name = '방 제목';
  String _subject = '병기본 과목 이름';
  String _mentor = '멘토 이름';
  int subjectCode;
  Room(this._name, this._subject, this._mentor, this.subjectCode);

  @override
  Widget build(BuildContext context) {
    return InkWell(child:
      Container(
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
                  Text(_subject,
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
                  Text(_mentor,
                      style: TextStyle(
                        fontSize: 15,
                        //color: Colors.white,
                        color: Colors.black,
                      )),
                  SizedBox(width: 30),
                  IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Meet_Header().mentorinfo(),
                                insetPadding:
                                    const EdgeInsets.fromLTRB(0, 80, 0, 80),
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
            ]),
          ],
        ),
      ),
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
        return Color.fromARGB(255, 231, 24, 24);
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
