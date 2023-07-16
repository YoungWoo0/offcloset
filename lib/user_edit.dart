import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserEditPage extends StatefulWidget {
  @override
  _UserEditPageState createState() => _UserEditPageState();
}

class _UserEditPageState extends State<UserEditPage> {
  TextEditingController _nicknameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  // Firestore에서 사용자 데이터 가져오기
  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      if (snapshot.exists) {
        setState(() {
          _nicknameController.text = snapshot.data()?['nickname'];
          _emailController.text = snapshot.data()?['email'];
        });
      }
    }
  }

  // 사용자 데이터 업데이트
  void updateUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'nickname': _nicknameController.text,
        'email': _emailController.text,
      });

      // 비밀번호 업데이트가 필요한 경우
      if (_passwordController.text.isNotEmpty) {
        user.updatePassword(_passwordController.text);
      }

      // 업데이트가 완료되면 알림 또는 페이지 이동 등의 추가 작업을 수행할 수 있습니다.
      print('사용자 데이터 업데이트 완료');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('내 정보 수정'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nicknameController,
              decoration: InputDecoration(
                labelText: '닉네임',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: '이메일',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: '비밀번호',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                updateUserData();
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFDC984F3), // 버튼 배경색을 보라색으로 변경
              ),
              child: Text('저장'),
            ),
          ],
        ),
      ),
    );
  }
}
