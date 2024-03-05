import 'package:firebase_auth/firebase_auth.dart';
import 'package:fp_ex/firebase_project/home.dart';
import 'package:fp_ex/firebase_project/searchID.dart';
import 'package:fp_ex/firebase_project/signup.dart';
import 'package:flutter/material.dart';
import 'package:fp_ex/firebase_project/mainlogin.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState()=>_LoginScreenState();
}

class _LoginScreenState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 뒤로가기 버튼이 눌렸을 때의 동작
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Mainlogin()),
        );
        return false; // 뒤로가기 동작을 막습니다.
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('로그인'),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => Mainlogin()),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child:Image.asset('assets/images/fineplaylogo.PNG', height: 120, width: 120
                  )
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: OutlinedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>
                            const Signup()),
                          );
                        },
                        child: const Text("회원가입"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: OutlinedButton(
                        onPressed: () async {
                          // 로그인 버튼이 눌렸을 때의 동작
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.blue), // 외곽선 색상
                          backgroundColor: Colors.grey, // 버튼 배경색
                        ),
                        child: const Text("로그인"),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(hintText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () async {
                    if (_usernameController.text.isEmpty ||
                        _passwordController.text.isEmpty) {
                      showDialog(
                        context: context, builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text('아이디 또는 비밀번호를 입력해주시기 바랍니다.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // 다이얼로그 닫기
                                Navigator.of(context).pop();
                              },
                              child: Text('확인'),
                            ),
                          ],
                        );
                      },
                      );
                      return;
                    }
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _usernameController.text.toLowerCase().trim(),
                        password: _passwordController.text.trim(),
                      );
                      print('로그인 완료. 반갑습니다!!');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    } on FirebaseAuthException catch (e) {
                      showDialog(context: context, builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('아이디 또는 비밀번호를 \n 잘못 입력했습니다.'),
                          content: Text('입력하신 내용을 다시 입력해주시기 바랍니다.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                // 다이얼로그 닫기
                                Navigator.of(context).pop();
                              },
                              child: Text('확인'),
                            ),
                          ],
                        );
                      },
                      );
                    };
                  },
                  child: Text('로그인'),
                ),
              ),
              InkWell(
                // InkWell을 사용하여 터치 이벤트 처리
                onTap: () {
                  // Text를 클릭하면 두 번째 페이지로 이동
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchID()),
                  );
                },
                child: Text(
                  '아이디/비밀번호 찾기',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),




            ],
          ),
        ),
      ),
    );
  }
}