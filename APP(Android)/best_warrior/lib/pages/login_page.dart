import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../component/auth.dart';
import 'package:firebase_database/firebase_database.dart';

//로그인 페이지
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController(); //이메일
  final TextEditingController _controllerPassword = TextEditingController(); //비밀번호
  final TextEditingController _controllername = TextEditingController(); //이름
  final TextEditingController _controllerarmy = TextEditingController(); //소속부대
  final TextEditingController _controllerclasses = TextEditingController(); //계급
  final TextEditingController _controllernumber = TextEditingController(); //군번
  DatabaseReference ref = FirebaseDatabase.instance.ref("USER"); //데이터 참조 변수

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
        
      );
      await ref.update({
      "${FirebaseAuth.instance.currentUser?.uid}": {
        "이름": _controllername.text,
        "소속부대": _controllerarmy.text,
        "계급": _controllerclasses.text,
        "군번": _controllernumber.text,
        "마일리지":0,
        "특급만든횟수":0
      }
    });
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return Column(
      children: [
        Image.asset(width: 300,height: 300,"assets/best_warrior-logo.png"),
      ],
    );
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : '다시 확인해주십시요 $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed:
          isLogin ? signInWithEmailAndPassword : createUserWithEmailAndPassword,
      child: Text(isLogin ? 'Login' : 'Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isLogin = !isLogin;
        });
      },
      child: Text(isLogin ? 'Register instead' : 'Login instead'),
    );
  }

  @override
  Widget build(BuildContext context) {
    //구성 방식
    if (isLogin) //로그인 페이지
      // ignore: curly_braces_in_flow_control_structures
      return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              _entryField('email', _controllerEmail),
              _entryField('password', _controllerPassword),
              _errorMessage(),
              _submitButton(),
              _loginOrRegisterButton(),
            ],
          ),
        ),
      );
    else //회원가입 페이지
      // ignore: curly_braces_in_flow_control_structures
      return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              _entryField('email', _controllerEmail),
              _entryField('password', _controllerPassword),
              _entryField('이름', _controllername),
              _entryField('계급', _controllerclasses),
              _entryField('소속부대', _controllerarmy),
              _entryField('군번', _controllernumber),
              _errorMessage(),
              _submitButton(),
              _loginOrRegisterButton(),
            ],
          ),
        ),
      );
  }
}
