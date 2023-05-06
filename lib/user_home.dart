import 'package:flutter/material.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('OFF-Closet'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Text(
                '선호 스타일 매장',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 200.0),
              Text(
                '내가 좋아요한 매장',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 200.0),
              Text(
                '지정 지역 매장 이벤트',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 200.0),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFDC984F3),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        //backgroundColor: Color(0xFDC984F3),
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '좋아요',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '마이페이지',
          ),
        ],
      ),
    );
  }
}