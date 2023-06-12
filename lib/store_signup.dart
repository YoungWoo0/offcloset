import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'store_registerimage.dart';
import 'dart:convert';


class StoreSignUpPage extends StatefulWidget {
  const StoreSignUpPage({Key? key}) : super(key: key);

  @override
  _StoreSignUpPageState createState() => _StoreSignUpPageState();
}

class _StoreSignUpPageState extends State<StoreSignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _ownerController = TextEditingController();

  String? _gender; // 성별 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFDC984F3),
        title: Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text('성별', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 16.0),
                  Radio<String>(
                    value: '남자',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text('남자', style: TextStyle(fontSize: 18)),
                  SizedBox(width: 16.0),
                  Radio<String>(
                    value: '여자',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  Text('여자', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: '이름',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이름을 입력해주세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: '아이디',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '아이디를 입력해주세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '비밀번호를 입력해주세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 80.0),
              //이메일 입력 시작
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: '이메일',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '이메일을 입력해주세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),//이메일 입력 끝
              TextFormField(
                controller: _ownerController,
                decoration: InputDecoration(
                  labelText: '사업자 등록 번호',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return '사업자 등록 번호를 입력해주세요.';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // 사업자 등록 번호 확인
                      bool isRegistrationNumberValid = await verifyBusinessRegistrationNumber(
                          _ownerController.text);

                      if (isRegistrationNumberValid) {
                        // 사업자 등록 번호가 유효한 경우 처리할 작업을 추가합니다
                        // 사용자 등록 또는 필요한 다른 작업을 진행합니다
                        // 다음 페이지로 이동합니다
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterImagePage()),
                        );
                      } else {
                        // 사업자 등록 번호가 유효하지 않은 경우 처리합니다
                        showDialog(
                          context: context,
                          builder: (context) =>
                              AlertDialog(
                                title: Text('사업자 등록 번호 확인'),
                                content: Text('유효하지 않은 사업자 등록 번호입니다.'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text('확인'),
                                  ),
                                ],
                              ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFDC984F3),
                  ),
                  child: Text('확인')
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // TODO: 회원가입 처리 로직 작성

                    // 다음 페이지로 이동
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterImagePage()), // style_tag.dart의 페이지를 불러옵니다.
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFDC984F3), // 버튼 배경색을 보라색으로 변경
                ),
                child: Text('다음'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//사업자 등록증 API 데이터 가져오기
class ownerModel {
  String b_no;
  String b_stt;
  String b_stt_cd;
  String tax_type;
  String tax_type_cd;
  String end_dt;
  String utcc_yn;
  String tax_type_change_dt;
  String invoice_apply_dt;

  ownerModel({
    required this.b_no,
    required this.b_stt,
    required this.b_stt_cd,
    required this.tax_type,
    required this.tax_type_cd,
    required this.end_dt,
    required this.utcc_yn,
    required this.tax_type_change_dt,
    required this.invoice_apply_dt
  });

  Map<String, dynamic> toJson() {
    return {
      'b_no': b_no,
      'b_stt': b_stt,
      'b_stt_cd': b_stt_cd,
      'tax_type': tax_type,
      'tax_type_cd': tax_type_cd,
      'end_dt': end_dt,
      'utcc_yn': utcc_yn,
      'tax_type_change_dt': tax_type_change_dt,
      'invoice_apply_dt': invoice_apply_dt,
    };
  }
  factory ownerModel.fromJson(Map<String, dynamic> json){
    return ownerModel(
      b_no: json['b_no'],
      b_stt: json["b_stt"],
      b_stt_cd: json["b_stt_cd"],
      tax_type: json["tax_type"],
      tax_type_cd: json["tax_type_cd"],
      end_dt: json["end_dt"],
      utcc_yn: json["utcc_yn"],
      tax_type_change_dt: json["tax_type_change_dt"],
      invoice_apply_dt: json["invoice_apply_dt"],
    );
  }
}

//사업자 등록 API 처리하는 함수
Future<bool> verifyBusinessRegistrationNumber(String registrationNumber) async {
  // API 엔드포인트로 HTTP POST 요청을 보냅니다
  var response = await http.post(
    Uri.parse('API_ENDPOINT_URL'), // 'API_ENDPOINT_URL' 부분을 실제 API 엔드포인트 URL로 교체합니다
    body: {
      'registrationNumber': registrationNumber,
    },
  );

  if (response.statusCode == 200) {
    // API 요청이 성공한 경우
    // 응답을 파싱하여 확인 결과를 반환합니다
    var responseData = jsonDecode(response.body);
    var owner = ownerModel.fromJson(responseData);
    return owner.b_no.isNotEmpty; // 예시로 'b_no' 필드가 비어있지 않으면 유효한 사업자 등록 번호로 간주합니다
  } else {
    // API 요청이 실패한 경우
    // 오류를 처리하거나 적절한 값을 반환합니다
    return false;
  }
}
//등록이 되어있는지만 확인 하면 될듯???