import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RankingBar extends StatelessWidget {
  int? rank;
  String name = '오류';
  int? score;

  RankingBar(int rank, String name, int score) {
    this.rank = rank;
    this.name = name;
    this.score = score;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 50,
      child: Column(
        children: [
          Row(children: [
            _buildHeaderAvatar(),
            Text(
              rank.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Aggro',
                  fontSize: 20),
            ),
            Text(
              rank.toString(),
              style: TextStyle(fontFamily: 'Aggro', fontSize: 20),
            ),
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Aggro',
                  fontSize: 20),
            ),
            Text(
              score.toString(),
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Aggro',
                  fontSize: 20),
            ),
          ]),
          _buildLine(),
        ],
      ),
    );
  }

  Widget _buildHeaderAvatar() {
    return SizedBox(
        width: 20,
        height: 20,
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/soldier.jpg"),
        ));
  }

  Widget _buildLine() {
    return Container(
      color: Colors.black,
      height: 1,
    );
  }
}
