import 'package:flutter/material.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'user_search.dart';
import 'user_home.dart';
import 'user_favorite.dart';
import 'user_mypage.dart';
/*
  미
  완
  성

  안써요 이거

 */

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController? controller;

  void initState(){
    super.initState();
    controller = TabController(initialIndex: 1, length: 4, vsync: this);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          UserSearchPage(),
          UserHomePage(),
          UserFavoritePage(),
          UserMypagePage()
        ],
        controller: controller,
      ),

      bottomNavigationBar: TabBar(
        tabs: <Tab>[
          Tab(
            icon: Icon(Icons.search),
          ),
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.favorite),
          ),
          Tab(
            icon: Icon(Icons.person),
          )
        ],
        labelColor: Color(0xFDC984F3),
        unselectedLabelColor: Colors.grey,
        indicatorColor: Color(0xFDC984F3),
        controller: controller,
      ),
    );
  }
}