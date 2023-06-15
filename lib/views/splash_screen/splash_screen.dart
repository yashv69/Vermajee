import 'package:Vermajee/consts/consts.dart';
import 'package:Vermajee/views/home_screen/home_page.dart';
import 'package:Vermajee/views/splash_screen/auth_screen/login_page.dart';
import 'package:Vermajee/widgets_common/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      //Get.to(() => const Login());

      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const Login());
        } else {
          Get.to(() => const HomePage());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
          child: Column(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg, width: 300)),
          20.heightBox,
          applogoWidget(),
          10.heightBox,
          Align(
              alignment: Alignment.center,
              child: quote.text.fontFamily(regular).size(16).black.make()),
          50.heightBox,
          const SpinKitHourGlass(
            color: Colors.black45,
            size: 50,
          ),
          const Spacer(),
          appversion.text.black.make(),
          credits.text.black.fontFamily(semibold).make(),
          30.heightBox,
          //our splash screen ui is ompleted.
        ],
      )),
    );
  }
}
