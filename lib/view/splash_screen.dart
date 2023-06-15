import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_pref_deemo/commen_wigets/Comman_text.dart';
import 'package:shared_pref_deemo/view/home_screen.dart';
import 'package:shared_pref_deemo/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  String? username;
  Future getusername() async {
    SharedPreferences sh = await SharedPreferences.getInstance();

    final name = sh.getString("username");
    setState(() {
      username = name;
    });
  }

  @override
  void initState() {
    getusername().whenComplete(
      () => Timer(
        Duration(seconds: 2),
        () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    username == null ? Login_Screen() : Home_Screen(),
              ));
        },
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Comman_Text(
              text: "Splash_Screen",
              color: Colors.black,
              fontsize: 30,
              fontweight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Center(
              child: CircularProgressIndicator(
            color: Colors.red,
            strokeWidth: 5,
          )),
        ],
      ),
    );
  }
}
