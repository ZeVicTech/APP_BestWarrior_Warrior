import 'package:best_warrior/component/room.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  //ProfileTab이 그려질때 단 한번만 실행되는 함수
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(child: _buildTabBarView()),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: Color.fromARGB(255, 0, 0, 0),
      indicatorColor: Colors.black,
      tabs: [
        Tab(
          text: "멘토로 있는 방",
        ),
        Tab(text: "멘티로 있는 방"),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        ListView(
          scrollDirection: Axis.vertical,
          children: 
            _roomList
          ,
        ),
        ListView(
          scrollDirection: Axis.vertical,
          children: _roomList,
        ),
      ],
    );
  }

  List<Widget> _roomList = [
    Room('주특기의 왕도', '주특기', '주경성', 1,"잘해봐요"),
    Room('가스! 가스! 가스!', '화생방', '이정호', 2,"열심히 하는사람만"),
    Room('초병의 권한 맛좀', '경계', '멘토 이름', 3,"화이팅 해봅시다"),
    Room('정신무장', '정신전력', '멘토 이름', 4,"안녕하세요 정신무장"),
    Room('사격 만발의 길', '개인화기', '멘토 이름', 5,"안녕하세요 사격만발의 길"),
    Room('몸만들면서 특급까지', '체력', '멘토 이름', 6,"안녕하세요 특급"),
    Room('주특기 족집게 과외', '주특기', '멘토 이름', 1,"안녕하세요"),
    Room('방독면 5초컷', '화생방', '멘토 이름', 2,"안녕하세요"),
    Room('경계의 신', '경계', '멘토 이름', 3,"안녕하세요"),
  ];

  
}
