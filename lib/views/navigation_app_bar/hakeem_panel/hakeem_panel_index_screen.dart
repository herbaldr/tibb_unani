import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/colors.dart';
import '../../../widgets/text_styles.dart';
import 'hakeem_panel_post_screen.dart';

class HakeemPanelIndexScreen extends StatefulWidget {
  String documentId;
  String title;
  HakeemPanelIndexScreen({required this.documentId, required this.title});

  @override
  State<HakeemPanelIndexScreen> createState() => _HakeemPanelIndexScreenState();
}

class _HakeemPanelIndexScreenState extends State<HakeemPanelIndexScreen> {

  @override
  Widget build(BuildContext context) {

    var _stream = FirebaseFirestore.instance
        .collection('mujarrabaat_e_tabib')
        .doc(widget.documentId)
        .collection("index")
        .snapshots();

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("${widget.title}"),
        centerTitle: true,
        backgroundColor: secondPrimaryColor,
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: StreamBuilder(
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
              return snapshot.hasData == null? Center(
                child: Text(
                  "There is no data in the server",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Get.height*0.1,
                      color: textWhiteColor
                  ),
                ),
              ) :
              ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        Get.to(
                          HakeemPanelPostScreen(
                            docId: widget.documentId,
                            documentId: snapshot.data!.docs[index].id,
                            title: snapshot.data!.docs[index].get("title")
                          )
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: secondPrimaryColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: kElevationToShadow[4],
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        margin: EdgeInsets.only(bottom: 12),
                        alignment: Alignment.center,
                        child: dataText("${snapshot.data!.docs[index].get("title")}"),
                      ),
                    );
                  }
              );
            }
        ),
      ),
    );
  }
}
