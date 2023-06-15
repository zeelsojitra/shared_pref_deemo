import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_pref_deemo/commen_wigets/Comman_Container.dart';
import 'package:shared_pref_deemo/commen_wigets/Comman_TeextFiled.dart';
import 'package:shared_pref_deemo/commen_wigets/Comman_text.dart';
import 'package:shared_pref_deemo/view/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final Username = TextEditingController();
  final Password = TextEditingController();
  final gloablekey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: gloablekey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Comman_TexxtFiled(
                controller: Username,
                filled: true,
                fillcolor: Colors.grey.shade300,
                onChanged: (value) {
                  gloablekey.currentState!.validate();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "plz Enter Name";
                  }
                },
                hinttext: "Enter Name",
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                disableborder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                FocusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                focouseborder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Comman_TexxtFiled(
                controller: Password,
                filled: true,
                fillcolor: Colors.grey.shade300,
                onChanged: (value) {
                  gloablekey.currentState!.validate();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "plz Enter Name";
                  }
                },
                hinttext: "Enter Password",
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                disableborder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                FocusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
                focouseborder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Comman_Container(
                  child: Center(
                    child: Comman_Text(
                      text: "Login",
                      color: Colors.white,
                      fontsize: 18,
                      fontweight: FontWeight.bold,
                    ),
                  ),
                  height: height * 0.06,
                  width: width,
                  color: Colors.indigo,
                  BorderRadius: BorderRadius.circular(40),
                  ontap: () async {
                    if (gloablekey.currentState!.validate()) {
                      SharedPreferences sh =
                          await SharedPreferences.getInstance();
                      sh.setString("username", Username.text).then(
                            (value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home_Screen(),
                              ),
                            ),
                          );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
