import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/text_styles.dart';

class MurakkabaatPostScreen extends StatefulWidget {

  late String documentId;
  late String indexName;

  MurakkabaatPostScreen({
    required this.documentId,
    required this.indexName
  });

  @override
  State<MurakkabaatPostScreen> createState() => _MurakkabaatPostScreenState();
}

class _MurakkabaatPostScreenState extends State<MurakkabaatPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("${widget.indexName}"),
        centerTitle: true,
        backgroundColor: secondPrimaryColor,
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('murakkabaat').doc(widget.documentId).collection("post").snapshots(),
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
                  return Container(
                    decoration: BoxDecoration(
                      color: secondPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: kElevationToShadow[4],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                    margin: EdgeInsets.only(bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // text for index no of medicine...
                        headerText("دوا نمبر : ${index+1}"),
                        // text for name header...
                        headerText("نام ادویہ :"),
                        dataText("${snapshot.data!.docs[index].get("title")}"),
                        SizedBox(height: 12),
                        headerText("اجزاء :"),
                        dataText("${snapshot.data!.docs[index].get("ingredients")}"),
                        SizedBox(height: 12),
                        headerText("ترکیب تیاری :"),
                        dataText("${snapshot.data!.docs[index].get("howToMade")}"),
                        SizedBox(height: 12),
                        headerText("فوائد :"),
                        dataText("${snapshot.data!.docs[index].get("benefits")}"),
                        SizedBox(height: 12),
                        headerText("مقدار خوراک :"),
                        dataText("${snapshot.data!.docs[index].get("dosage")}"),
                        SizedBox(height: 12),
                        headerText("حواله کتاب :"),
                        dataText("${snapshot.data!.docs[index].get("reference")}"),
                        SizedBox(height: 12),
                        headerText("نوٹ :"),
                        dataText("${snapshot.data!.docs[index].get("note")}"),
                      ],
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