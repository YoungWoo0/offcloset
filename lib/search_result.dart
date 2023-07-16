import 'package:flutter/material.dart';
import 'user_search.dart';
import 'user_home.dart';
import 'user_favorite.dart';
import 'user_mypage.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResultPage> {
  int _selectedIndex = 0;

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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _pages[_selectedIndex]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final imageNames = [
      '청바지1.jpg',
      '청바지2.jpg',
      '청바지3.jpg',
      '청바지4.jpg',
      '청바지5.jpg',
      '청바지6.jpg',
      '청바지7.jpg',
      '청바지8.jpg',
    ];

    final List<String> storeNames = [
      '아웃핏',
      '리테이크',
      '버프',
      '원더플레이스',
      '매장5',
      '매장6',
      '매장7',
      '매장8',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('검색 결과'),
        automaticallyImplyLeading: false, // 뒤로가기 버튼 없애기
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search, color: Colors.purple,),
                  hintText: '검색어를 입력하세요',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.purple), // Set border color
                  ),
                  focusedBorder: OutlineInputBorder( // Set focused border color
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                  contentPadding: EdgeInsets.only(left: 30),
                ),
              ),
              SizedBox(height: 5.0),

              Divider( // 작대기 추가
                color: Colors.purple,
                height: 30.0, // 작대기의 높이
                thickness: 1.0, // 작대기의 두께
                indent: 0.0, // 작대기의 시작 위치에서의 여백
                endIndent: 0.0, // 작대기의 끝 위치에서의 여백
              ),
              Text(
                '검색 결과',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
              ),
              SizedBox(height: 5.0),

              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.658,
                children: List.generate(imageNames.length, (index) {
                  final imagePath = 'assets/images/${imageNames[index]}';
                  final tag = storeNames[index];

                  return GestureDetector(
                    onTap: () {
                      // 이미지 클릭 시 동작 구현
                    },
                    child: Card(
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 0.75, // 비율 조정
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              tag,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
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
