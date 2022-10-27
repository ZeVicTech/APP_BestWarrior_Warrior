import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class profileGradeInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DataTable(
          border: TableBorder.all(color: Color.fromARGB(255, 0, 0, 0)),
          columnSpacing: 10,
          horizontalMargin: 10,
          dataRowHeight: 30,
          dataTextStyle:
              TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
          headingRowHeight: 30,
          headingTextStyle:
              TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
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
          ]);
  }
}
