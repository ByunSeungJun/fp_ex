import 'package:firebase_core/firebase_core.dart';
import 'package:fp_ex/firebase_project/mainlogin.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBKbcD-5u_ae40Apg8rgtrpyL4eLdMN8ko',
        appId: '1:137109629915:android:fc95feadf5726cfe3615fe',
        messagingSenderId: '137109629915',
        projectId: 'fineplay-f0706',
      ));


  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Auth App',
      home: Mainlogin(),
    );
  }
}


