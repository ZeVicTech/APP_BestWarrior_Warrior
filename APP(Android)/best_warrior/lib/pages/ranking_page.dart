import 'package:best_warrior/component/ranking_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Scaffold(
        appBar: AppBar(
          title: Text('우리부대 특급전사 순위'),
        ),
        body: ListView(
          children: [
            RankingBar(1, '이정호', 100),
            RankingBar(2, '고창효', 90),
            RankingBar(3, '윤병인', 80),
            RankingBar(4, '권우현', 70),
            RankingBar(5, '엄득용', 60),
            RankingBar(6, '김영승', 50),
            RankingBar(7, '성유찬', 40),
            RankingBar(8, '안충현', 30),
            RankingBar(9, '민세현', 20),
          ],
        ),
      ),
    );
  }
}
