import 'package:best_warrior/component/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../pages/chatting_page.dart';
import '../pages/profile_page.dart';
import 'chatting_provider.dart';

class Meet_Header extends StatelessWidget {
  String title;
  String mentor;
  String introduce;
  Meet_Header(this.title,this.mentor,this.introduce);

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
        this.title,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
      ),
      Text(
        "멘토:"+this.mentor,
        style: TextStyle(fontSize: 15),
      ),
      Text(
        "소개:"+this.introduce,
        style: TextStyle(fontSize: 15),
      ),
    ]);
  }

  Widget meet_join(context) {
    return ElevatedButton.icon(
      onPressed: () {      
        showDialog(
          context: context,
          barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text('이 소모임에 가입 신청하시겠습니까?'),
              insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
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
          }
        );
      },
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

  Widget mentorinfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      Text(
        "멘토정보",
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 5),
      Row(children: [
        SizedBox(
            width: 100,
            height: 100,
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/soldier.jpg"),
            )),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "병장 엄득용",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            Text(
              "특급만든횟수:100",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "특기:체육",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ]),
      SizedBox(height: 5),
      DataTable(
          border: TableBorder.all(color: Color.fromARGB(255, 0, 0, 0)),
          columnSpacing: 10,
          horizontalMargin: 10,
          dataRowHeight: 20,
          dataTextStyle:
              TextStyle(fontSize: 10, color: Color.fromARGB(255, 0, 0, 0)),
          headingRowHeight: 20,
          headingTextStyle:
              TextStyle(fontSize: 10, color: Color.fromARGB(255, 0, 0, 0)),
          columns: [
            DataColumn(label: Text('주특기')),
            DataColumn(label: Text('정신전력')),
            DataColumn(label: Text('화생방')),
            DataColumn(label: Text('경계')),
            DataColumn(label: Text('개인화기')),
            DataColumn(label: Text('체력'))
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('특급')),
              DataCell(Text('특급')),
              DataCell(Text('특급')),
              DataCell(Text('특급')),
              DataCell(Text('특급')),
              DataCell(Text('특급'))
            ])
          ]),
      SizedBox(height: 5),
      Text("멘티들의 리뷰"),
      meet_item(),
      meet_item(),
      meet_item()
    ]);
  }
  Widget meet_item(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Text("김영승", style: TextStyle(fontSize: 12),),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(30))),
                child: Text(
                  "너무 좋아용", style: TextStyle(color: Colors.white, fontSize: 12)),
              )
            ]
          )
        ]
      )
    );
  }
  
}
