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

class StoreInfoScreen extends StatelessWidget {
  final Store store = Store(
    name: '매장 이름',
    imageUrl: '매장 이미지 URL',
    location: '매장 위치',
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
            Image.network(store.imageUrl),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '위치: ${store.location}',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '게시물:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8.0),
            Column(
              children: store.posts.map((post) {
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.description),
                  // 게시물에 대한 추가 정보를 표시할 수 있습니다.
                );
              }).toList(),
            ),
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
