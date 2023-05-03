import 'package:flutter/material.dart';
import 'user_home.dart';

class StyleTagPage extends StatelessWidget {
  const StyleTagPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('선호 스타일'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.0),
          Text(
            '  선호하는 스타일 태그를 선택해주세요.',
            style: TextStyle(fontSize: 17, color: Colors.purple),
          ),
          SizedBox(height: 300.0),
          Text(
            '       <<< 스타일 태그 >>>',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 200.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UserHomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFDC984F3), // 버튼 배경색을 보라색으로 변경
                  ),
                  child: Text('다음'),
                )
              )
            ],
          ),
        ],
      ),
    );
  }
}