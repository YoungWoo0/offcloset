import 'package:flutter/material.dart';
import 'user_home.dart';
import 'user_favorite.dart';
import 'user_mypage.dart';
import 'search_result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserSearchPage extends StatefulWidget {
  const UserSearchPage({Key? key}) : super(key: key);

  @override
  _UserSearchPageState createState() => _UserSearchPageState();
}

class _UserSearchPageState extends State<UserSearchPage> {
  int _selectedIndex = 0;
  List<String> recentSearches = ['캐주얼', '오버핏', '가죽자켓']; // 최근 검색어 목록
  List<String> hotSearches = ['반팔', '반바지', '여름옷', '카고팬츠', '반팔셔츠', '편안한옷', '티셔츠', '반팔니트', '청바지', '바람막이']; // 요즘 뜨는 검색어 목록

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
  Future<void> _searchFirestore(String query) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('yourCollectionName') // 데이터베이스 컬렉션 이름을 적절히 변경하세요.
          .where('fieldToSearch', isEqualTo: query) // 검색 조건 설정
          .get();

      List<DocumentSnapshot> documents = snapshot.docs;
      // documents에서 필요한 데이터를 추출하여 사용하세요.
      // 예: List<String> searchResults = documents.map((doc) => doc['title']).toList();
      //     또는 SearchResultPage에 결과를 전달할 수도 있습니다.

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultPage(query: query, results: documents),
        ),
      );
    } catch (e) {
      print("Error searching Firestore: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('검색'),
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
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search, color: Colors.purple,),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchResultPage(query: 'yourQuery', results: []),
                      ));
                    },
                  ),
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
                onSubmitted: (query) {
                  _searchFirestore(query); // 검색어를 입력하면 Firestore 검색 함수 호출
                },
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
                ' 최근 검색어',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),

              Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                children: recentSearches.map((search) {
                  return Chip(
                    label: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          search,
                          style: TextStyle(fontSize: 15.0),
                        ),

                        IconButton(
                          icon: Icon(Icons.clear),
                          iconSize: 16.0,
                          onPressed: () {
                            // 해당 검색어 삭제 로직 추가
                            setState(() {
                              recentSearches.remove(search);
                            });
                          },
                        ),

                      ],
                    ),
                    backgroundColor: Colors.grey[300],
                    deleteButtonTooltipMessage: '삭제',
                  );
                }).toList(),
              ),
              SizedBox(height: 100.0),
              Divider( // 작대기 추가
                color: Colors.purple,
                height: 30.0, // 작대기의 높이
                thickness: 1.0, // 작대기의 두께
                indent: 0.0, // 작대기의 시작 위치에서의 여백
                endIndent: 0.0, // 작대기의 끝 위치에서의 여백
              ),

              Text(
                ' 요즘 뜨는 검색어',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  final rank = index + 1;
                  final rank2 = index + 6;
                  final search = hotSearches[index];
                  final search2 = hotSearches[index+5];

                  return ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '$rank. $search',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '   $rank2. $search2',
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.0),
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
