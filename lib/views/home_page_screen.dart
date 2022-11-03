import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tibb_unani/views/mufridaat/mufridaat_index_screen.dart';
import 'package:tibb_unani/views/murakkabaat/murakkabaat_index_screen.dart';
import '../utils/colors.dart';
import '../widgets/app_drawer.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // app drawer that located on
      // top left side off the app bar...
      drawer: AppDrawer(),

      // App Bar starting from here...
      appBar: AppBar(
        title: Text("Welcome To The App"),
        centerTitle: true,
        backgroundColor: secondPrimaryColor,
        actions: [
          Icon(Icons.more_vert)
        ],
      ),

      // Body Of the middle Screen here...
      body: Container(
        margin: EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    Get.to(MufridaatIndexScreen());
                  },
                  child: Container(
                    height: Get.height*0.3,
                    width: Get.width*0.42,
                    decoration: BoxDecoration(
                      color: secondPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: kElevationToShadow[4],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Book Name",
                          style: TextStyle(
                              color: textWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        Text(
                          "Mufridaat",
                          style: TextStyle(
                              color: textWhiteColor
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Writer Name",
                          style: TextStyle(
                              color: textWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        Text(
                          "Hakeem Junaid",
                          style: TextStyle(
                              color: textWhiteColor
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.to(MurakkabaatIndexScreen());
                  },
                  child: Container(
                    height: Get.height*0.3,
                    width: Get.width*0.42,
                    decoration: BoxDecoration(
                      color: secondPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: kElevationToShadow[4],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Book Name",
                          style: TextStyle(
                              color: textWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        Text(
                          "Murakkabaat",
                          style: TextStyle(
                              color: textWhiteColor
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Writer Name",
                          style: TextStyle(
                              color: textWhiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                        Text(
                          "Hakeem Junaid",
                          style: TextStyle(
                              color: textWhiteColor
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: Get.height*0.3,
                  width: Get.width*0.42,
                  decoration: BoxDecoration(
                    color: secondPrimaryColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: kElevationToShadow[4],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Book Name",
                        style: TextStyle(
                            color: textWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      Text(
                        "Mufridaat",
                        style: TextStyle(
                            color: textWhiteColor
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Writer Name",
                        style: TextStyle(
                            color: textWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      Text(
                        "Hakeem Junaid",
                        style: TextStyle(
                            color: textWhiteColor
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: Get.height*0.3,
                  width: Get.width*0.42,
                  decoration: BoxDecoration(
                    color: secondPrimaryColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: kElevationToShadow[4],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Book Name",
                        style: TextStyle(
                            color: textWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      Text(
                        "Mufridaat",
                        style: TextStyle(
                            color: textWhiteColor
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        "Writer Name",
                        style: TextStyle(
                            color: textWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                      Text(
                        "Hakeem Junaid",
                        style: TextStyle(
                            color: textWhiteColor
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )
    );
  }
}
