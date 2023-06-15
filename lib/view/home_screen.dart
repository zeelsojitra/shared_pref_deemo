import 'package:flutter/material.dart';
import 'package:shared_pref_deemo/commen_wigets/Comman_text.dart';
import 'package:shared_pref_deemo/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Comman_Text(
              text: "Home_Page",
              fontweight: FontWeight.bold,
              fontsize: 30,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () async {
              SharedPreferences sh = await SharedPreferences.getInstance();
              sh.remove("username").then(
                    (value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login_Screen(),
                      ),
                    ),
                  );
            },
            icon: Icon(
              Icons.login,
              color: Colors.black,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
