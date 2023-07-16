import 'package:flutter/material.dart';
import 'user_home.dart';

class StyleResultImagePage extends StatelessWidget {
  const StyleResultImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('선호 스타일 결과'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50.0),
          Text(
            '   회원님의 선호 스타일 결과는',
            style: TextStyle(fontSize: 25, color: Colors.purple),
          ),
          SizedBox(height: 70.0),
          Text(
            '        1.     캐주얼           60%',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 50.0),
          Text(
            '        2.     클래식           20%',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 50.0),
          Text(
            '        3.     스트릿           20%',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(height: 250.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 70.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserHomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFDC984F3), // 버튼 배경색을 보라색으로 변경
                      fixedSize: const Size(250.0, 60.0), // 버튼의 크기 조정
                    ),
                    child: Text('OFF-Closet 시작하기'),
                  )
              )
            ],
          ),
        ],
      ),
    );
  }
}