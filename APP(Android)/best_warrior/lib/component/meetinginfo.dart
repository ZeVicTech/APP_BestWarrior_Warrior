import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import '../pages/profile_page.dart';
import 'package:table_calendar/table_calendar.dart';

class Meet_Header extends StatelessWidget {
  const Meet_Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        meet_profile_image(),
        SizedBox(width: 20),
        meet_profileinfo(),
      ],
    );
  }

  Widget meet_profile_image() {
    return SizedBox(
        width: 100,
        height: 100,
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/soldier.jpg"),
        ));
  }

  Widget meet_profileinfo() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "사격 화이팅",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
      ),
      Text(
        "사격 특급하고싶은 사람 오세요",
        style: TextStyle(fontSize: 13),
      ),
      Text(
        "3/4",
        style: TextStyle(fontSize: 13),
      ),
    ]);
  }

  Widget meet_calendar() {
    return TableCalendar(
        firstDay: DateTime.utc(2022, 1, 1),
        lastDay: DateTime.utc(2029, 12, 30),
        focusedDay: DateTime.now()
        );
  }

  Widget meet_join() {
    return ElevatedButton.icon( 
      onPressed: (){},
      label: Text("신청하기"),
      icon: Icon(Icons.add),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        primary: Color.fromARGB(1, 255, 255, 255),
          onPrimary: Color.fromARGB(255, 0, 0, 0),
        minimumSize: Size(100, 50)
      ), 
    );
  }

  Widget meet_chat() {
    return IconButton(
      icon: Icon(Icons.chat),
      color: Color.fromARGB(255, 0, 0, 0),
      onPressed: () {}
    );
  }
}
