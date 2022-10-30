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
            DataTable(columnSpacing: 28.0,
              columns: [
              DataColumn(label: Text('순위'), numeric: true),
              DataColumn(label: Text('소속')),
              DataColumn(label: Text('계급')),
              DataColumn(label: Text('이름')),
              DataColumn(label: Text('점수'), numeric: true),
            ], rows: [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('2탄약중대')),
                DataCell(Text('병장')),
                DataCell(Text('엄득용')),
                DataCell(Text('100')),
              ]),
              DataRow(cells: [
                DataCell(Text('2')),
                DataCell(Text('2탄약중대')),
                DataCell(Text('병장')),
                DataCell(Text('김영승')),
                DataCell(Text('90')),
              ]),
              DataRow(cells: [
                DataCell(Text('3')),
                DataCell(Text('2탄약중대')),
                DataCell(Text('병장')),
                DataCell(Text('강기석')),
                DataCell(Text('80')),
              ]),
              DataRow(cells: [
                DataCell(Text('4')),
                DataCell(Text('2탄약중대')),
                DataCell(Text('병장')),
                DataCell(Text('남준호')),
                DataCell(Text('70')),
              ]),
              DataRow(cells: [
                DataCell(Text('5')),
                DataCell(Text('2탄약중대')),
                DataCell(Text('상병')),
                DataCell(Text('고창효')),
                DataCell(Text('60')),
              ]),
              DataRow(cells: [
                DataCell(Text('6')),
                DataCell(Text('2탄약중대')),
                DataCell(Text('상병')),
                DataCell(Text('주경성')),
                DataCell(Text('50')),
              ]),
              DataRow(cells: [
                DataCell(Text('7')),
                DataCell(Text('2탄약중대')),
                DataCell(Text('상병')),
                DataCell(Text('권우현')),
                DataCell(Text('40')),
              ]),
              DataRow(cells: [
                DataCell(Text('8')),
                DataCell(Text('2탄약중대')),
                DataCell(Text('상병')),
                DataCell(Text('홍길동')),
                DataCell(Text('39')),
              ]),
              DataRow(cells: [
                DataCell(Text('9')),
                DataCell(Text('2탄약중대')),
                DataCell(Text('일병')),
                DataCell(Text('한우진')),
                DataCell(Text('38')),
              ]),
              DataRow(cells: [
                DataCell(Text('10')),
                DataCell(Text('2탄약중대')),
                DataCell(Text('일병')),
                DataCell(Text('김수한')),
                DataCell(Text('37')),
              ]),
              DataRow(cells: [
                DataCell(Text('11')),
                DataCell(Text('2탄약중대')),
                DataCell(Text('일병')),
                DataCell(Text('김지원')),
                DataCell(Text('36')),
              ]),
            ])
          ],
        ),
      ),
    );
  }
}
