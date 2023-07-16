import 'package:flutter/material.dart';
import 'user_search.dart';
import 'user_home.dart';
import 'user_favorite.dart';
import 'user_mypage.dart';
import 'mainPage.dart';
import 'StoreScreen.dart';

enum StoreType {
  Favorite,
  Local,
  Event,
}

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  _UserHomePageState createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  int _selectedIndex = 1;
  StoreType _currentStoreType = StoreType.Favorite;
  bool isFavorite1 = false;
  bool isFavorite2 = false;

  // 선호하는 매장들의 이미지 파일명 리스트
  final List<String> favoriteStores = [
    '스트릿1.jpg',
    '스트릿2.jpg',
    '스트릿3.jpg',
    '스트릿4.jpg',
    '스트릿5.jpg',
    '캐주얼1.jpg',
    '캐주얼2.jpg',
    '캐주얼3.jpg',
    // 'https://example.com/store1.jpg',
    // 'https://example.com/store2.jpg',
    // 'https://example.com/store3.jpg',
  ];

  // 선호하는 매장들의 이미지 파일명 리스트
  final List<String> localStores = [
    '스트릿1.jpg',
    '스트릿2.jpg',
    '스트릿3.jpg',
    '스트릿4.jpg',
    '스트릿5.jpg',
    '캐주얼1.jpg',
    '캐주얼2.jpg',
    '캐주얼3.jpg',
    // 'https://example.com/store1.jpg',
    // 'https://example.com/store2.jpg',
    // 'https://example.com/store3.jpg',
  ];

  final List<String> eventStores = [
    '스트릿1.jpg',
    '스트릿2.jpg',
    '스트릿3.jpg',
    '스트릿4.jpg',
    '스트릿5.jpg',
    '캐주얼1.jpg',
    '캐주얼2.jpg',
    '캐주얼3.jpg',
    // 'https://example.com/store1.jpg',
    // 'https://example.com/store2.jpg',
    // 'https://example.com/store3.jpg',
  ];

  // 이미지 경로를 반환하는 함수
  String getImagePath(StoreType storeType, int index) {
    List<String> storeList;
    switch (storeType) {
      case StoreType.Favorite:
        storeList = favoriteStores;
        break;
      case StoreType.Local:
        storeList = localStores;
        break;
      case StoreType.Event:
        storeList = eventStores;
        break;
    }
    return 'assets/images/${storeList[index]}';
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

  void _onStoreTypeSelected(StoreType storeType) {
    setState(() {
      _currentStoreType = storeType;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('OFF-Closet'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _onStoreTypeSelected(StoreType.Favorite),
                    style: ElevatedButton.styleFrom(
                      primary: _currentStoreType == StoreType.Favorite
                          ? Colors.purple // 선택된 버튼의 배경색 (보라색)
                          : Color(0xFDC984F3), // 선택되지 않은 버튼의 배경색 (흰색)
                    ),
                    child: SizedBox(
                      width: 89, // 버튼의 너비 조정
                      child: Text('선호스타일 매장'),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  ElevatedButton(
                    onPressed: () => _onStoreTypeSelected(StoreType.Local),
                    style: ElevatedButton.styleFrom(
                      primary: _currentStoreType == StoreType.Local
                          ? Colors.purple // 선택된 버튼의 배경색 (보라색)
                          : Color(0xFDC984F3), // 선택되지 않은 버튼의 배경색 (흰색)
                    ),
                    child: SizedBox(
                      width: 77, // 버튼의 너비 조정
                      child: Text('지정지역 매장'),
                    ),
                  ),
                  SizedBox(width: 7.0),
                  ElevatedButton(
                    onPressed: () => _onStoreTypeSelected(StoreType.Event),
                    style: ElevatedButton.styleFrom(
                      primary: _currentStoreType == StoreType.Event
                          ? Colors.purple // 선택된 버튼의 배경색 (보라색)
                          : Color(0xFDC984F3), // 선택되지 않은 버튼의 배경색 (흰색)
                    ),
                    child: SizedBox(
                      width: 77, // 버튼의 너비 조정
                      child: Text('지정지역 매장 이벤트'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.0),


              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 7.0,
                        crossAxisSpacing: 7.0,
                      ),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        final imagePath = getImagePath(_currentStoreType, index);
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
                              color: Colors.black.withOpacity(0.6),
                              border: Border.all(),
                              image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '원더플레이스',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '#스트릿 #힙합 #오버핏',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorite1 = !isFavorite1;
                              });
                            },
                            icon: Icon(
                              isFavorite1 ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite1 ? Colors.purple : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.0),

              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 7.0,
                        crossAxisSpacing: 7.0,
                      ),
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        final imagePath = getImagePath(_currentStoreType, index+4);
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
                              color: Colors.black.withOpacity(0.6),
                              border: Border.all(),
                              image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '원더플레이스22222',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '#스트릿 #힙합 #오버핏',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isFavorite2 = !isFavorite2;
                              });
                            },
                            icon: Icon(
                              isFavorite2 ? Icons.favorite : Icons.favorite_border,
                              color: isFavorite2 ? Colors.purple : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFDC984F3),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
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
