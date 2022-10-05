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
      labelColor: Colors.yellow,
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
          children: [
            Container(
              color: Colors.red,
              height: 50,
              child: Text(
                'A',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              color: Colors.blue,
              height: 50,
              child: Text(
                'A',
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              color: Colors.green,
              height: 50,
              child: Text(
                'A',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        Container(color: Colors.black,)
      ],
    );
  }
}
