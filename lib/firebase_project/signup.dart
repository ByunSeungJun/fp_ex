import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'mainlogin.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<Signup> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  bool _isAgreed1 = false;
  bool _isAgreed2 = false;
  bool _isAgreed3 = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // 뒤로가기 버튼이 눌렸을 때의 동작
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Mainlogin()),
        );
        return false; // 뒤로가기 동작을 막습니다.
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('회원가입'),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mainlogin()),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Image.asset('assets/images/fineplaylogo.PNG',
                        height: 120, width: 120)),
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
                              MaterialPageRoute(
                                  builder: (context) => Signup()),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.blue),
                            backgroundColor: Colors.grey,
                          ),
                          child: Text(
                            "회원가입",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: OutlinedButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login()),
                            );
                          },
                          child: Text("로그인"),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: _nicknameController,
                    decoration: InputDecoration(hintText: '성명(필수)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(hintText: 'Email(필수)'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(hintText: '비밀번호 6자리 이상 입력'),
                  ),
                ),
                Container(
                  height: 25, // 원하는 높이로 조절
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isAgreed1,
                        onChanged: (value) {
                          setState(() {
                            _isAgreed1 = value ?? false;
                          });
                        },
                      ),
                      SizedBox(width: 8),
                      Text('이용약관 동의'),

                    ],
                  ),
                ),
                Container(
                  height: 25, // 원하는 높이로 조절
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isAgreed2,
                        onChanged: (value) {
                          setState(() {
                            _isAgreed2 = value ?? false;
                          });
                        },
                      ),
                      SizedBox(width: 8),
                      Text('개인정보수집 이용 동의'),
                    ],
                  ),
                ),
                Container(
                  height: 25, // 원하는 높이로 조절
                  child: Row(
                    children: [
                      Checkbox(
                        value: _isAgreed3,
                        onChanged: (value) {
                          setState(() {
                            _isAgreed3 = value ?? false;
                          });
                        },
                      ),
                      SizedBox(width: 8),
                      Text('만 14세 이상입니다.'),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () async {
                      if (_isAgreed1 & _isAgreed2 & _isAgreed3) {
                        if (_usernameController.text.isEmpty ||
                            _passwordController.text.isEmpty ||
                            _nicknameController.text.isEmpty) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text('입력을 다시 해주시기 바랍니다.'),
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
                      } else {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Text('약관에 동의해주셔야합니다.'),
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
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _usernameController.text.toLowerCase().trim(),
                          password: _passwordController.text.trim(),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Login()),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'email-already-in-use') {
                          // 이미 존재하는 이메일에 대한 예외 처리
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text('이미 존재하는 이메일입니다.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (e.code == 'weak-password') {
                          // 비밀번호가 6자 이하인 경우에 대한 예외 처리
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text('비밀번호는 최소 6자 이상이어야 합니다.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('확인'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      }
                    },
                    child: Text('회원가입'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
