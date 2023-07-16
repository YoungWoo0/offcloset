import 'package:flutter/material.dart';
import 'user_search.dart';
import 'user_home.dart';
import 'user_favorite.dart';
import 'user_mypage.dart';
import 'StoreScreen.dart';
import 'mainPage.dart';

enum StoreType {
  Favorite,
  Local,
  Event,
}

class UserFavoritePage extends StatefulWidget {
  const UserFavoritePage({Key? key}) : super(key: key);

  @override
  _UserFavoritePageState createState() => _UserFavoritePageState();
}

class _UserFavoritePageState extends State<UserFavoritePage> {
  int _selectedIndex = 2;
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

  // 이미지 경로를 반환하는 함수
  String getImagePath(StoreType storeType, int index) {
    List<String> storeList;
    switch (storeType) {
      case StoreType.Favorite:
        storeList = favoriteStores;
        break;
    }
    return 'assets/images/${favoriteStores[index]}';
  }

  @override
  Widget build(BuildContext context) {
    bool isFavorite1 = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('좋아요'),
        automaticallyImplyLeading: false, // 뒤로가기 버튼 없애기
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Text(
                '좋아요한 매장 목록',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.purple),
              ),
              SizedBox(height: 20.0),

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
                              isFavorite1 ? Icons.favorite_border : Icons.favorite,
                              color: isFavorite1 ? Colors.black : Colors.purple,
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


              /*
              ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: favoriteStores.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(favoriteStores[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreInfoScreen(),
                      ),
                    );
                  },
                );
              }
              )*/
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
