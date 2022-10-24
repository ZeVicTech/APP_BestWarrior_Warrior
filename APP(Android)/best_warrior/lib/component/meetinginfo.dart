import 'package:best_warrior/component/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../pages/chatting_page.dart';
import '../pages/profile_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'chatting_provider.dart';

class Meet_Header extends StatelessWidget {
  Meet_Header({super.key});

  User user = User();

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
        focusedDay: DateTime.now());
  }

  Widget meet_join() {
    return ElevatedButton.icon(
      onPressed: () {},
      label: Text("신청하기"),
      icon: Icon(Icons.add),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          primary: Color.fromARGB(1, 255, 255, 255),
          onPrimary: Color.fromARGB(255, 0, 0, 0),
          minimumSize: Size(100, 50)),
    );
  }

  Widget meet_chat(context) {
    return FutureBuilder(
        future: user.userinfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을 때 실행되는 부분
          if (snapshot.hasData == false) {
            return CircularProgressIndicator(); // CircularProgressIndicator : 로딩 에니메이션
          } //error가 발생하게 될 경우 반환하게 되는 부분
          else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                style: TextStyle(fontSize: 15),
              ),
            );
          }

          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 부분
          else {
            return IconButton(
                icon: Icon(Icons.chat),
                color: Color.fromARGB(255, 0, 0, 0),
                onPressed: () {
                  var u = Uuid().v1();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                            create: (context) => ChattingProvider(
                                u, snapshot.data[2]), //유저 이름 들어갈곳
                            child: ChattingPage(),
                          )));
                });
          }
        });
  }
}
