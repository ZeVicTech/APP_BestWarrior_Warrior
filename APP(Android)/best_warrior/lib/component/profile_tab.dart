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
            mento_roomList
          ,
        ),
        ListView(
          scrollDirection: Axis.vertical,
          children: menti_roomList,
        ),
      ],
    );
  }

  List<Widget> menti_roomList = [
    Room('주특기의 왕도', '주특기', '주경성', 1,"잘해봐요"),
    Room('주특기 족집게 과외', '주특기', '김시호', 1,"안녕하세요"),
  ];

    List<Widget> mento_roomList = [
    Room('방독면 5초컷', '화생방', '엄득용', 2,"안녕하세요"),
    Room('경계의 신', '경계', '엄득용', 3,"안녕하세요"),
  ];


  
}
