import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../../../provider/ad_provider.dart';
import '../../../utils/colors.dart';
import '../../../widgets/text_styles.dart';

class HakeemPanelPostScreen extends StatefulWidget {
  String docId;
  String documentId;
  String title;
  HakeemPanelPostScreen({required this.docId ,required this.documentId, required this.title});

  @override
  State<HakeemPanelPostScreen> createState() => _HakeemPanelPostScreenState();
}

class _HakeemPanelPostScreenState extends State<HakeemPanelPostScreen> {

  @override
  Widget build(BuildContext context) {

    var _stream = FirebaseFirestore.instance
        .collection('mujarrabaat_e_tabib')
        .doc(widget.docId)
        .collection("index")
        .doc(widget.documentId)
        .collection("post")
        .snapshots();

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("${widget.title}"),
        centerTitle: true,
        backgroundColor: secondPrimaryColor,
      ),
      body: Column(
        children: [
          Container(
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
                  if (snapshot.hasData == null) {
                    return Center(
                    child: Text(
                      "There is no data in the server",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Get.height*0.1,
                          color: textWhiteColor
                      ),
                    ),
                  );
                  } else {
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){
                          return Container(
                            decoration: BoxDecoration(
                              color: secondPrimaryColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: kElevationToShadow[4],
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                            margin: EdgeInsets.only(bottom: 12),
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                dataText("${snapshot.data!.docs[index].get("title")}"),
                                Text(
                                  "${snapshot.data!.docs[index].get("ingredients")}",
                                  style: mediumTextStyle(),
                                ),
                                Text(
                                  "${snapshot.data!.docs[index].get("howToMade")}",
                                  style: mediumTextStyle(),
                                ),
                                Text(
                                  "${snapshot.data!.docs[index].get("benefits")}",
                                  style: mediumTextStyle(),
                                ),
                                Text(
                                  "${snapshot.data!.docs[index].get("dosage")}",
                                  style: mediumTextStyle(),
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                    );
                  }
                }
            ),
          ),
        ],
      ),
    );
  }
}
