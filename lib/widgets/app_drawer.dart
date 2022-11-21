import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tibb_unani/utils/colors.dart';
import 'package:tibb_unani/widgets/text_styles.dart';
import '../services/auth_services.dart';
import '../views/auth_screens/sign_in_screen.dart';

class AppDrawer extends StatefulWidget {

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
      child: ListView(
        children: [
          /// Drawer header for display information...
          Container(
            decoration: BoxDecoration(
                color: secondPrimaryColor
            ),
            child: DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: largeTextStyle(),
                  ),
                  Text(
                    "${user.email}",
                      style: mediumTextStyle()
                  )
                ],
              )
            ),
          ),
          /// setting button and text...
          Container(
            padding: EdgeInsets.only(top: 12),
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Text(
                  "Settings",
                  style: mediumTextStyle(),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.settings,
                  color: Colors.white,
                )
              ],
            ),
          ),
          /// Logout button and text...
          Container(
            padding: EdgeInsets.only(top: 12),
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: InkWell(
              onTap: (){
                AuthService().signOut()
                    .then((uid) => {
                  Fluttertoast.showToast(msg: "Successfully logout"),
                  Get.offAll(SignInScreen())
                }).catchError((e){
                  Fluttertoast.showToast(msg: e!.message);
                });
              },
              child: Row(
                children: [
                  Text(
                    "Log-out",
                    style: mediumTextStyle(),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: Get.height*0.02)
        ],
      ),
    );
  }
}
