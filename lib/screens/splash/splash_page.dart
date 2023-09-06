import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sir_expenso/constants.dart';
import 'package:sir_expenso/screens/onboarding/login_page.dart';
import 'package:sir_expenso/ui_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 20), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getAppLogoUI(),
            hSpacer(),
            Text(AppConstants.app_name, style: TextStyle(
              fontSize: 25,
            ),)
          ],
        ),
      ),
    );
  }

  Widget getAppLogoUI(){
    return CircleAvatar(
      backgroundColor: AppColors.blackColor,
      radius: 54,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset('assets/icons/app_logo.png', color: Colors.white,),
      ),
    );
  }
}
