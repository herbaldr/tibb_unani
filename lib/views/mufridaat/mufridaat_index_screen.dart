import 'package:cloud_firestore/cloud_firestore.dart';
import '../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mufridaat_post_screen.dart';

class MufridaatIndexScreen extends StatefulWidget {
  const MufridaatIndexScreen({Key? key}) : super(key: key);

  @override
  State<MufridaatIndexScreen> createState() => _MufridaatIndexScreenState();
}

class _MufridaatIndexScreenState extends State<MufridaatIndexScreen> {

  Stream<QuerySnapshot<Map<String, dynamic>>> _stream = FirebaseFirestore.instance.collection('mufridaat').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // App Bar starting from here...
      appBar: AppBar(
        title: Text("Book Name"),
        centerTitle: true,
        backgroundColor: secondPrimaryColor,
      ),

      // Body Of the middle Screen here...
      body: StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                color: appWhiteColor,
              ),
            );
          }
          if(snapshot.hasError){
            return Center(
              child: Text("No data"),
            );
          }
          return Container(
            margin: EdgeInsets.all(15),
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  // clickable button...
                  return InkWell(
                    onTap: (){
                      Get.to(
                        MufridaatPostScreen(
                          documentId: snapshot.data!.docs[index].id,
                          indexName: snapshot.data!.docs[index].get("title"),
                        )
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: secondPrimaryColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: kElevationToShadow[4],
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: Text(
                        '${snapshot.data!.docs[index].get("title")}',
                        style: TextStyle(
                            color: textWhiteColor.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                    ),
                  );
                }
            ),
          );
        }
      ),
    );
  }
}



