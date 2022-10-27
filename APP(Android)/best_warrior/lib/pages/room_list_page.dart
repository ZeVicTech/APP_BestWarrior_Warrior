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
  int? selectedIndex;
  List<Tech> _chipsList = [
    Tech("주특기", Colors.green),//과목코드 1
    Tech("화생방", Colors.blueGrey),//과목코드 2
    Tech("경계", Colors.deepOrange),//과목코드 3
    Tech("정신전력", Colors.cyan),//과목코드 4
    Tech("개인화기", Colors.yellow),//과목코드 5
    Tech("체력", Color.fromARGB(255, 238, 30, 186))//과목코드 6
  ];

  List<Room> _roomList = [
    Room('사격특급의 길', '개인화기', '주경성', 1),
    Room('체력 왕', '체력', '이정호', 1),
    Room('방 제목', '병기본 과목', '멘토 이름', 2),
    Room('방 제목', '병기본 과목', '멘토 이름', 3),
    Room('방 제목', '병기본 과목', '멘토 이름', 4),
    Room('방 제목', '병기본 과목', '멘토 이름', 5),
    Room('방 제목', '병기본 과목', '멘토 이름', 6),
    Room('방 제목', '병기본 과목', '멘토 이름', 1),
    Room('방 제목', '병기본 과목', '멘토 이름', 2),
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
                    children: _roomList,
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
}

class Tech {
  String label;
  Color color;
  Tech(this.label, this.color);
}
