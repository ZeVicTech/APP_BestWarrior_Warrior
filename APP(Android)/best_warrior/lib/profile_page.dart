import 'package:best_warrior/component/profile_grade_info.dart';
import 'package:best_warrior/component/profile_tab.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'component/profile_header.dart';

class ProfilePage extends StatelessWidget {

  Future<Object?> getname() async{
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('USER/엄득용/이름').get();
    if (snapshot.exists) {
      return(snapshot.value);
    }   
    else{
      return('No data available.');
    }
    //return snapshot.value;
  }
  
  String name() {
    Object a=getname(); //{"엄득용"}
    var g = a.toString().replaceAll(RegExp("{|}|이름: |: "), ""); // 엄득용
        g.trim();
    var l = g.split(','); //[엄득용]
    return l[0];
  }

   Widget _getname(){
    return Text(
      name(),
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
    );
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보'),
        centerTitle: true,
      ),
      body: Column(
        children: [
            SizedBox(height: 20),
            _getname(),
            SizedBox(height: 20),
            profileGradeInfo(),
            SizedBox(height: 20),
            Expanded(child:ProfileTab()),
        ],
      ),
    );
  }
}
