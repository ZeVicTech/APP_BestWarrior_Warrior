import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../component/calender.dart';
import '../component/meetinginfo.dart';
import '../pages/profile_page.dart';

class MeetingroomPage extends StatelessWidget {
  const MeetingroomPage({super.key});

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
          Meet_Header(),
          SizedBox(height: 10),
          Calendar(),    //달력
          Row(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 20),
              Meet_Header().meet_join(context),      //신청하기 버튼
              Meet_Header().meet_chat(context),  //채팅 버튼    
            ],
          )
          ],
      )
    );
  }
}