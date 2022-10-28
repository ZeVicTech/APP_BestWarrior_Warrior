import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class User {
  DatabaseReference ref = FirebaseDatabase.instance.ref("USER");

  Future<String> getuser() async {
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('USER/${FirebaseAuth.instance.currentUser?.uid}').get();
    return snapshot.value.toString();
  }

  Future<List> userinfo() async {
    var a = await getuser();
    var g = a
        .replaceAll(RegExp("{|} |계급: |군번: |마일리지: |소속부대: |이름: |특급만든횟수"), "");
    g.trim();
    var userinfo = g.split(',');
    return userinfo;
  }
//FlutterAnimatedList 목록들 정렬
//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//future builder 예시

/*
      FutureBuilder(
        future: setuser(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을 때 실행되는 부분
          if (snapshot.hasData == false) {
            return CircularProgressIndicator(); // CircularProgressIndicator : 로딩 에니메이션
          }
          else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                style: TextStyle(fontSize: 15),
              ),
            );
          }
          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 부분
          else {
            return Text(
              snapshot.data.toString(), // 비동기 처리를 통해 받은 데이터를 텍스트에 뿌려줌
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            );
          }
        });
      }
*/
  Widget _getname() {
    return FutureBuilder(
        future: userinfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //해당 부분은 data를 아직 받아 오지 못했을 때 실행되는 부분
          if (snapshot.hasData == false) {
            return CircularProgressIndicator(); // CircularProgressIndicator : 로딩 에니메이션
          } //error가 발생하게 될 경우 반환하게 되는 부분
          else if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                style: TextStyle(fontSize: 15),
              ),
            );
          }

          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 부분
          else {
            return Text(
              snapshot.data.toString(), // 비동기 처리를 통해 받은 데이터를 텍스트에 뿌려줌
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            );
          }
        });
  }
}
