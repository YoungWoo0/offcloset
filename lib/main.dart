import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'user_signup.dart';
import 'user_home.dart';
import 'mainPage.dart';
import 'user_search.dart';
import 'user_home.dart';
import 'user_favorite.dart';
import 'user_mypage.dart';
import 'SignUp_choice.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => const SignUpChoice(),
        '/main': (context) => MainPage(),
        '/search': (context) => UserSearchPage(),
        '/home': (context) => UserHomePage(),
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signIn(BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // 로그인이 성공하면 홈 페이지로 이동
      Navigator.pushNamed(context, '/home');
    } catch (e) {
      // 로그인 실패 처리
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('로그인 실패'),
          content: Text('아이디 또는 비밀번호가 올바르지 않습니다.'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFDC984F3), // 버튼 배경색을 보라색으로 변경
              ),
              onPressed: () => Navigator.pop(context),
              child: Text('확인'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Off-closet',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '많이 사용해주세요 *^^*\n원석이 지상이 영우 화이팅~\nVer 1.0.0',
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 250.0), // 간격 조절용 SizedBox 추가
              SizedBox(
                width: 300.0,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: '아이디',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple), // 보라색 테두리 설정
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple), // 보라색 테두리 설정
                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              SizedBox(
                width: 300.0,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple), // 보라색 테두리 설정
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purple), // 보라색 테두리 설정
                    ),
                    labelStyle: TextStyle(color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {Navigator.pushNamed(context, '/signup'); // 라우트 이름으로 페이지 이동
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFDC984F3), // 버튼 배경색을 보라색으로 변경
                    ),
                    child: Text('회원가입'),
                  ),
                  SizedBox(width: 20.0),
                  ElevatedButton(
                    onPressed: () async {
                      await _signIn(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFDC984F3), // 버튼 배경색을 보라색으로 변경
                    ),
                    child: Text('로그인'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}