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
  int selectedIndex = 0; //전체방을 보기위한 인덱스
  final TextEditingController _controller_rname = TextEditingController();
  List<String> dropdownList = ['주특기', '화생방', '경계', '정신전력', '개인화기', '체력'];
  String selectedDropdown = '주특기';

  List<Tech> _chipsList = [
    Tech("전체", Colors.black), //과목코드 0
    Tech("주특기", Colors.green), //과목코드 1
    Tech("화생방", Colors.blueGrey), //과목코드 2
    Tech("경계", Colors.deepOrange), //과목코드 3
    Tech("정신전력", Colors.cyan), //과목코드 4
    Tech("개인화기", Colors.yellow), //과목코드 5
    Tech("체력", Colors.purple) //과목코드 6
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
            child: Column(children: [
              Container(
                height: 100,
                child: Wrap(
                  spacing: 6,
                  direction: Axis.horizontal,
                  children: techChips(), //병기본 과목들 토글버튼
                ),
              ),
              Expanded(
                child: Stack(children: [
                  ListView(
                    children: setRoom(),
                  ),
                  Positioned(
                      bottom: 15,
                      right: 10,
                      child: RawMaterialButton(
                          //방추가하기 +버튼
                          child: Icon(Icons.add, size: 35.0),
                          fillColor: Colors.green,
                          padding: EdgeInsets.all(15.0),
                          shape: CircleBorder(),
                          onPressed: () {
                            //방 만들기 팝업창
                            showDialog(
                                context: context,
                                barrierDismissible: false, // 바깥 영역 터치시 닫을지 여부
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('방 만들기'),
                                    content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                              controller: _controller_rname,
                                              decoration: InputDecoration(
                                                labelText: "방이름",
                                              )),
                                          DropdownButton(
                                            //과목이름
                                            value: selectedDropdown,
                                            items:
                                                dropdownList.map((String item) {
                                              return DropdownMenuItem<String>(
                                                child: Text('$item'),
                                                value: item,
                                              );
                                            }).toList(),
                                            onChanged: (dynamic value) {
                                              setState(() {
                                                selectedDropdown = value;
                                              });
                                            },
                                          ),
                                        ]),
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
                                          switch (selectedDropdown) {
                                            case "주특기":
                                              _roomList.add(Room(
                                                  _controller_rname.text,
                                                  selectedDropdown,
                                                  "엄득용",
                                                  1));
                                              break;
                                            case "화생방":
                                              _roomList.add(Room(
                                                  _controller_rname.text,
                                                  selectedDropdown,
                                                  "엄득용",
                                                  2));
                                              break;
                                            case "경계":
                                              _roomList.add(Room(
                                                  _controller_rname.text,
                                                  selectedDropdown,
                                                  "엄득용",
                                                  3));
                                              break;
                                            case "정신전력":
                                              _roomList.add(Room(
                                                  _controller_rname.text,
                                                  selectedDropdown,
                                                  "엄득용",
                                                  4));
                                              break;
                                            case "개인화기":
                                              _roomList.add(Room(
                                                  _controller_rname.text,
                                                  selectedDropdown,
                                                  "엄득용",
                                                  5));
                                              break;
                                            case "체력":
                                              _roomList.add(Room(
                                                  _controller_rname.text,
                                                  selectedDropdown,
                                                  "엄득용",
                                                  6));
                                              break;
                                          }
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                });
                          }))
                ]),
              ),
            ])));
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
    if (selectedIndex == 0) {
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
