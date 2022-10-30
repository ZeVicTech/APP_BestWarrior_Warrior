import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../component/calender.dart';
import '../component/meetinginfo.dart';
import '../pages/profile_page.dart';

class MeetingroomPage extends StatelessWidget {
  String _name = '방 제목';
  String _subject = '병기본 과목 이름';
  String _mentor = '멘토 이름';
  String introduce ='소개글';
  MeetingroomPage(this._name, this._mentor, this.introduce);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        centerTitle: true,
        title: Text('모임정보'),
        leading:  IconButton(
            onPressed: () {
              Navigator.pop(context); //뒤로가기
            },
            color: Color.fromARGB(255, 255, 255, 255),
            icon: Icon(Icons.arrow_back)),
      ) ,
      body: Column(
        children: [
          SizedBox(height: 20),
          Meet_Header(_name,_mentor,introduce),
          SizedBox(height: 10),
          Calendar(_name,_mentor,introduce),    //달력
          ],
      )
    );
  }
}