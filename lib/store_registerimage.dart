import 'package:flutter/material.dart';
import 'user_home.dart';

class RegisterImagePage extends StatelessWidget {
  const RegisterImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('매장 이미지 등록'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15.0),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '매장 사진과 대표 의류 사진을 등록하세요.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.purple,
              ),
            ),
          ),

          SizedBox(height: 30.0),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '매장 사진',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(height: 10.0),


          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              height: 50.0,
              width: 200.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2.0),
                shape: BoxShape.rectangle,
              ),
              child: Center(
                child: Icon(
                  Icons.camera_alt,
                  size: 50.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 30.0),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '대표 의류 사진 (최대 20장)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),

          SizedBox(height: 10.0),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: 20, // 4x5 배열을 위해 20개의 아이템을 표시
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4개의 열
                  crossAxisSpacing: 5.0, // 수평 간격
                  mainAxisSpacing: 5.0, // 수직 간격
                  childAspectRatio: 1.0, // 정사각형 비율
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 30.0,
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: 10.0),


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

          SizedBox(height: 40.0),


        ],
      ),
    );
  }
}