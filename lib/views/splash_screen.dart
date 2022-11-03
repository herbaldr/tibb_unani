import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _splashTimer();
  }

  _splashTimer() {
    return Timer(
        Duration(seconds: 3),
            () {
          Get.offAll(Wrapper());
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                'assets/svg_icons/mortar_pestle.svg',
                color: appWhiteColor,
                height: Get.height*0.2,
              ),
              SizedBox(
                height: Get.height*0.25,
                width: Get.height*0.25,
                child: CircularProgressIndicator(
                  color: appWhiteColor,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white.withOpacity(0.8)),
                  strokeWidth: 6,

                ),
              )
            ],
          )
      )
    );
  }
}
