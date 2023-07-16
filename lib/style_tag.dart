import 'package:flutter/material.dart';
import 'user_home.dart';
import 'user_styleResult.dart';

class StyleTagPage extends StatefulWidget {
  const StyleTagPage({Key? key}) : super(key: key);

  @override
  _StyleTagPageState createState() => _StyleTagPageState();
}

class _StyleTagPageState extends State<StyleTagPage> {
  List<String> selectedTags = [];

  void toggleTag(String tag) {
    setState(() {
      if (selectedTags.contains(tag)) {
        selectedTags.remove(tag);
      } else {
        if (selectedTags.length < 5) {
          selectedTags.add(tag);
        } else {
          // You can show a snackbar or display an error message here
          print('Cannot select more than 5 tags');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageNames = [
      '스트릿1.jpg',
      '스트릿2.jpg',
      '스트릿3.jpg',
      '스트릿4.jpg',
      '스트릿5.jpg',
      '캐주얼1.jpg',
      '캐주얼2.jpg',
      '캐주얼3.jpg',
      '캐주얼4.jpg',
      '캐주얼5.jpg',
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFDC984F3),
        title: const Text('선호 스타일'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15.0),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '선호하는 스타일 태그를 선택해주세요.(최대 5개)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.purple,
              ),
            ),
          ),

          const SizedBox(height: 5.0),
          SizedBox(
            height: 600.0,
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(10, (index) {
                final imagePath = 'assets/images/${imageNames[index]}';
                final tag = 'Tag ${index + 1}';
                final isSelected = selectedTags.contains(tag);
                return GestureDetector(
                  onTap: () => toggleTag(tag),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.purple : Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: isSelected ? Colors.purple : Colors.grey,
                            width: 3.0,
                          ),
                        ),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      if (isSelected)
                        Container(
                          padding: const EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 16.0,
                          ),
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StyleResultImagePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFDC984F3),
                  ),
                  child: const Text('다음'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
