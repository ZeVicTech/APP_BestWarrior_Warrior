import 'package:best_warrior/component/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class RoomListPage extends StatefulWidget {
  const RoomListPage({super.key});

  @override
  State<RoomListPage> createState() => _RoomListPageState();
}

class _RoomListPageState extends State<RoomListPage> {
  int selectedIndex = 0;//전체방을 보기위한 인덱스
  List<Tech> _chipsList = [
    Tech("전체", Colors.black), //과목코드 0
    Tech("주특기", Colors.green), //과목코드 1
    Tech("화생방", Colors.blueGrey), //과목코드 2
    Tech("경계", Colors.deepOrange), //과목코드 3
    Tech("정신전력", Colors.cyan), //과목코드 4
    Tech("개인화기", Colors.yellow), //과목코드 5
    Tech("체력", Color.fromARGB(255, 238, 30, 186)) //과목코드 6
  ];

  List<Room> _roomList = [
    Room('주특기의 왕도', '주특기', '주경성', 1),
    Room('가스! 가스! 가스!', '화생방', '이정호', 2),
    Room('초병의 권한 맛좀 볼래', '경계', '멘토 이름', 3),
    Room('정신무장', '정신전력', '멘토 이름', 4),
    Room('사격 만발의 길', '개인화기', '멘토 이름', 5),
    Room('몸만들면서 특급까지', '체력', '멘토 이름', 6),
    Room('주특기 족집게 과외', '주특기', '멘토 이름', 1),
    Room('방독면 5초컷', '화생방', '멘토 이름', 2),
    Room('경계의 신', '경계', '멘토 이름', 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('소모임 리스트'),
          centerTitle: true,
        ),
        body: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  height: 100,
                  child: Wrap(
                    spacing: 6,
                    direction: Axis.horizontal,
                    children: techChips(),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: setRoom(),
                  ),
                ),
              ],
            )));
  }

  List<Widget> techChips() {
    List<Widget> chips = [];
    for (int i = 0; i < _chipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(left: 10, right: 5),
        child: ChoiceChip(
          label: Text(_chipsList[i].label),
          labelStyle: TextStyle(color: Colors.white),
          backgroundColor: _chipsList[i].color,
          selected: selectedIndex == i,
          onSelected: (bool value) {
            setState(() {
              selectedIndex = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  List<Widget> setRoom() {
    List<Widget> rooms = [];
    if(selectedIndex == 0){
        return _roomList;
      }
    for (int i = 0; i < _roomList.length; i++) {
      if (selectedIndex == _roomList[i].subjectCode) {
        rooms.add(_roomList[i]);
      }
    }
    return rooms;
  }
}

class Tech {
  String label;
  Color color;
  Tech(this.label, this.color);
}
