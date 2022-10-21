import 'package:best_warrior/component/profile_grade_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class ManagerGradeInfo extends StatefulWidget {
  const ManagerGradeInfo({super.key});

  @override
  State<ManagerGradeInfo> createState() => _ManagerGradeInfoState();
}

class _ManagerGradeInfoState extends State<ManagerGradeInfo> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(children: [
          Text(
            '소속: 2탄약중대 계급: 병장 이름: 엄득용',
            style: TextStyle(color: Colors.white),
          ),
          profileGradeInfo()
        ]),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
