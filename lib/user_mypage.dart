import 'package:flutter/material.dart';
import 'user_search.dart';
import 'user_home.dart';
import 'user_favorite.dart';
import 'user_mypage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_edit.dart';
import 'style_tag.dart';

class UserMypagePage extends StatefulWidget {
  const UserMypagePage({Key? key}) : super(key: key);

  @override
  _UserMypagePageState createState() => _UserMypagePageState();
}

class _UserMypagePageState extends State<UserMypagePage> {
  int _selectedIndex = 3;
  String? nickname;

  @override
  void initState() {
    super.initState();
    fetchNickname();
  }

  // Firestore에서 닉네임 가져오기
  Future<String?> getNickname(String uid) async {
    DocumentSnapshot<Map<String, dynamic>> snapshot =
    await FirebaseFirestore.instance.collection('users').doc(uid).get();

    if (snapshot.exists) {
      return snapshot.data()?['nickname'];
    } else {
      return null;
    }
  }

  void fetchNickname() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String? retrievedNickname = await getNickname(user.uid);
      setState(() {
        nickname = retrievedNickname;
      });
    }
  }

  final List<Widget> _pages = <Widget>[
    UserSearchPage(),
    UserHomePage(),
    UserFavoritePage(),
    UserMypagePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[_selectedIndex]),
    );
  }

  // 로그아웃 동작 수행
  void _logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('마이페이지'),
        automaticallyImplyLeading: false, // 뒤로가기 버튼 없애기
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Row(
                children: [
                  Image.asset("assets/images/원석이.jpeg", height: 100, width: 100),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      nickname ?? '',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '선호 스타일',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StyleTagPage()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '  변경하기  ',
                        style: TextStyle(fontSize: 16, color: Colors.purple),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                '1.#캐주얼   2.#클래식   3.#스트릿',
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserEditPage()),
                  );
                },
                child: Text(
                  '내 정보 수정',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                '내 위치 설정',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Text(
                '방문한 매장',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              Text(
                '고객 센터',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50.0),
              ElevatedButton(
                onPressed: _logout,
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFDC984F3),
                ),
                child: Text('로그아웃'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFDC984F3),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        //backgroundColor: Color(0xFDC984F3),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
