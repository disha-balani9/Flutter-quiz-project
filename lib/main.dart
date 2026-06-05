import 'package:flutter/material.dart';
import 'screens/login_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(

        primarySwatch: Colors.indigo,

        scaffoldBackgroundColor: Color(0xFFF5F7FB),

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo,
          elevation: 0,
          centerTitle: true,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),

      home: LoginForm(),
    );
  }
}