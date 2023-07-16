import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'user_signup.dart';
import 'user_home.dart';
import 'mainPage.dart';
import 'user_search.dart';
import 'user_home.dart';
import 'user_favorite.dart';
import 'user_mypage.dart';


class Store {
  final String name;
  final String imageUrl;
  final String location;
  final List<Post> posts;

  Store({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.posts,
  });
}

class Post {
  final String title;
  final String description;

  Post({
    required this.title,
    required this.description,
  });
}

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


class StoreInfoScreen extends StatelessWidget {
  final Store store = Store(
    name: '매장 정보',
    imageUrl: '매장 이미지 URL',
    location: '충청남도 천안시 동남구 먹거리10길 27',
    posts: [
      Post(title: '게시물 1', description: '게시물 1 설명'),
      Post(title: '게시물 2', description: '게시물 2 설명'),
      Post(title: '게시물 3', description: '게시물 3 설명'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text(store.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image.network(store.imageUrl),
            SizedBox(height: 16.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Image.asset(
                'assets/images/원더플레이스.jpg',
                width: 500,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 16.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '원더플레이스',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),

            SizedBox(height: 5.0),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xFDC984F3), // 보라색으로 설정
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '${store.location}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),

            SizedBox(height: 5.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Color(0xFDC984F3), // 보라색으로 설정
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '영업 중 ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    ' 22:00에 종료',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),

            SizedBox(height: 5.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '#스트릿 #힙합 #오버핏',
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
            ),


            Divider( // 작대기 추가
              color: Colors.purple,
              height: 20.0, // 작대기의 높이
              thickness: 1.0, // 작대기의 두께
              indent: 16.0, // 작대기의 시작 위치에서의 여백
              endIndent: 16.0, // 작대기의 끝 위치에서의 여백
            ),



            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '게시물',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),

            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.658,
              children: List.generate(favoriteStores.length, (index) {
                final imagePath = 'assets/images/${favoriteStores[index]}';
                //final tag = storeNames[index];

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
                        /*
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            tag,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                );
              }),
            ),
            /*
            Column(
              children: store.posts.map((post) {
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.description),
                  // 게시물에 대한 추가 정보를 표시할 수 있습니다.
                );
              }).toList(),
            ),*/
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFDC984F3),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        //backgroundColor: Color(0xFDC984F3),

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
