import 'package:event_mgmt_sys/utils/route_constants.dart';
import 'package:event_mgmt_sys/utils/shared_pref_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SharedPrefHelper.init();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 500)).then((value) async {
        if (await SharedPrefHelper().getBoolValueFrmPref(isLoggedIn)) {
          Navigator.pushReplacementNamed(context, homeRoute);
        } else {
          Navigator.pushReplacementNamed(context, loginRoute);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/app_icon.png",
          height: 64,
          width: 64,
        ),
      ),
    );
  }
}
