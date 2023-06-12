import 'package:flutter/material.dart';
import 'store_signup.dart';
import 'user_signup.dart';
import 'main.dart';
//import 'store_signup.dart';
class SignUpChoice extends StatelessWidget {
  const SignUpChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFDC984F3),
          title: Text("회원 분류 페이지"),
        ),
        body:
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(height: 100,),

              Text('일반회원',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                ),

              ),

              Text('14세 이상 개인',
                style: TextStyle(
                  fontSize: 20.0,
                ),),

              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,MaterialPageRoute(builder: (_) => const SignUpPage()
                    )
                    );
                  }, child: Text("가입하기"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFDC984F3),
                    onPrimary: Colors.white,
                  )
              ),

              SizedBox(height: 50,),
              Divider(
                height: 10,
                color: Colors.grey,
                thickness: 1,
              ),
              SizedBox(height: 50,),


              Text('사장님',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                ),
              ),

              Text('사업자 및 매장 관리자',
                style: TextStyle(
                  fontSize: 20.0,
                ),),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,MaterialPageRoute(builder: (_) => const StoreSignUpPage()
                    )
                    );
                  }, child: Text("가입하기"),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFDC984F3),
                    onPrimary: Colors.white,
                  )
              ),
              SizedBox(height: 100,),

            ],
          ),
        )

    );
  }
}