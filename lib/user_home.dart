import 'package:flutter/material.dart';
import 'user_search.dart';
import 'user_home.dart';
import 'user_favorite.dart';
import 'user_mypage.dart';
import 'mainPage.dart';
import 'StoreScreen.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _selectedIndex = 1;

  //선호하는 매장들의 이미지 URL 리스트
  final List<String> favoriteStores = [
    'https://example.com/store1.jpg',
    'https://example.com/store2.jpg',
    'https://example.com/store3.jpg',
  ];

  final List<Widget> _pages = <Widget>[
    UserSearchPage(),
    UserHomePage(),
    UserFavoritePage(),
    UserMypagePage(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });

    //Navigator.pushNamed(context, '/main');

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[_selectedIndex]),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('OFF-Closet'),
        automaticallyImplyLeading: false, // 뒤로가기 버튼 없애기
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Text(
                '선호 스타일 매장 리스트',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 50.0),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: favoriteStores.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreInfoScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          image: NetworkImage(favoriteStores[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Text(
                '지정 지역 매장 리스트',
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