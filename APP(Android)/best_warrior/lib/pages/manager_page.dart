import 'package:best_warrior/component/manager_grade_info.dart';
import 'package:best_warrior/component/profile_grade_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({super.key});

  @override
  State<ManagerPage> createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('용사 병기본 점수 목록'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              ManagerGradeInfo(),
              ManagerGradeInfo(),
              ManagerGradeInfo(),
              ManagerGradeInfo(),
              ManagerGradeInfo(),
              ManagerGradeInfo(),
              ManagerGradeInfo(),
              ManagerGradeInfo(),
              ManagerGradeInfo(),
              ManagerGradeInfo(),
              ManagerGradeInfo(),
              ManagerGradeInfo(),
              ManagerGradeInfo(),
            ],
          )
        ],
      ),
    );
  }
}
