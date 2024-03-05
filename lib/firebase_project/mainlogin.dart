import 'package:flutter/material.dart';
import 'package:fp_ex/firebase_project/home.dart';
import 'package:fp_ex/firebase_project/login.dart';
import 'package:fp_ex/firebase_project/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:uuid/uuid.dart';

class Mainlogin extends StatefulWidget {
  const Mainlogin({Key? key}) : super(key: key);

  @override
  _MainLoginState createState() => _MainLoginState();
}

class _MainLoginState extends State<Mainlogin> {
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
            clientId:
                '137109629915-rnmmrmqti39qfoaqrqmi2sqgu59q2obe.apps.googleusercontent.com')
        .signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 로고 이미지
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Image.asset(
                'assets/images/fineplaylogo.PNG',
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),

            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () async {
                // 구글 로그인 버튼 눌렀을 때의 처리
                try {
                  await signInWithGoogle();
                  print("Google Sign-In 성공");
                  // 로그인 성공 후 다음 화면으로 이동 또는 다른 작업 수행
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(),
                    ),
                  );
                } catch (error) {
                  print("Google Sign-In 에러: $error");
                }
              },
              child: Text('구글로 로그인/시작',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                // 네이버 로그인 버튼 눌렀을 때의 처리
              },
              child: Text('네이버로 로그인/시작',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {
                        // 이메일 로그인 버튼 눌렀을 때의 처리
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      child: Text('이메일로 로그인',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange),
                      onPressed: () {
                        // 이메일 가입 버튼 눌렀을 때의 처리
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                      child: Text('이메일로 가입',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    return _MainLoginState();
  }
}
