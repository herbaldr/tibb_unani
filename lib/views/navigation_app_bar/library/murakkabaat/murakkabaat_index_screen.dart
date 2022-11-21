import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import 'murakkabaat_post_screen.dart';


class MurakkabaatIndexScreen extends StatefulWidget {

  String bookName;
  MurakkabaatIndexScreen({required this.bookName});

  @override
  State<MurakkabaatIndexScreen> createState() => _MurakkabaatIndexScreenState();
}

class _MurakkabaatIndexScreenState extends State<MurakkabaatIndexScreen> {

  Stream<QuerySnapshot<Map<String, dynamic>>> _stream = FirebaseFirestore.instance.collection('murakkabaat').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // App Bar starting from here...
      appBar: AppBar(
        title: Text("${widget.bookName}"),
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
            child: snapshot.data == null? Center(
              child: Text(
                "There is no data in the server",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Get.height*0.1,
                    color: textWhiteColor
                ),
              ),
            ) :
            Directionality(
              textDirection: TextDirection.rtl,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    childAspectRatio: 1/1
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  // clickable button...
                  return InkWell(
                    onTap: (){
                      Get.to(
                          MurakkabaatPostScreen(
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
                      padding: EdgeInsets.symmetric(vertical: 18),
                      alignment: Alignment.center,
                      child: Text(
                        '${snapshot.data!.docs[index].get("title")}',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: textWhiteColor.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),
                      ),
                    ),
                  );
                }
              )
            ),
          );
        }
      ),
    );
  }
}



