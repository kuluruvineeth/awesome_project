import 'package:awesone_project/pages/home_page.dart';
import 'package:awesone_project/pages/login_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: LoginPage(),
    theme: ThemeData(
      primarySwatch: Colors.purple
    ),
    routes: {
      LoginPage.routeName : (context) => LoginPage(),
      HomePage.routeName : (context) => HomePage()

    }
  );
  }
}



