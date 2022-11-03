import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class MufridaatPostScreen extends StatefulWidget {

  late String documentId;
  late String indexName;

  MufridaatPostScreen({
    required this.documentId,
    required this.indexName

  });

  @override
  State<MufridaatPostScreen> createState() => _MufridaatPostScreenState();
}

class _MufridaatPostScreenState extends State<MufridaatPostScreen> {

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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(15),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('mufridaat').doc(widget.documentId).collection("post").snapshots(),
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
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
                itemBuilder: (context,index){
                  return Container(
                    decoration: BoxDecoration(
                      color: secondPrimaryColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: kElevationToShadow[4],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12,horizontal: 12),
                    margin: EdgeInsets.only(bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // if at 1st book index we show these texts
                        headerText("دوا نمبر : ${index+1}"),
                        // text for name header...
                        Text(
                          'نام ادویہ :',
                          style: TextStyle(
                              color: textWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        // text of name data..
                        Text(
                          '${snapshot.data!.docs[index].get("title")}',
                          style: TextStyle(
                            color: textWhiteColor,
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        SizedBox(height: 12),
                        // text for other Name header..
                        Text(
                          'دیگر نام :',
                          style: TextStyle(
                              color: textWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        // text for other name data..
                        Text(
                          "${snapshot.data!.docs[index].get("otherNames")}",
                          style: TextStyle(
                            color: textWhiteColor,
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        SizedBox(height: 12),
                        Text(
                          "شناخت :",
                          style: TextStyle(
                            color: textWhiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        Text(
                          "${snapshot.data!.docs[index].get("identification")}",
                          style: TextStyle(
                            color: textWhiteColor,
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        SizedBox(height: 12),
                        Text(
                          'مقام پیدائش :',
                          style: TextStyle(
                            color: textWhiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        Text(
                          "${snapshot.data!.docs[index].get("whereToFind")}",
                          style: TextStyle(
                            color: textWhiteColor,
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        SizedBox(height: 12),
                        Text(
                          "مزاج :",
                          style: TextStyle(
                            color: textWhiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        Text(
                          "${snapshot.data!.docs[index].get("modOfAction")}",
                          style: TextStyle(
                            color: textWhiteColor,
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        SizedBox(height: 12),
                        Text(
                          "مضر :",
                          style: TextStyle(
                              color: textWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        Text(
                          "${snapshot.data!.docs[index].get("harmful")}",
                          style: TextStyle(
                            color: textWhiteColor,
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        SizedBox(height: 12),
                        Text(
                          'مصلح :',
                          style: TextStyle(
                              color: textWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        Text(
                          "${snapshot.data!.docs[index].get("improve")}",
                          style: TextStyle(
                            color: textWhiteColor,
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        SizedBox(height: 12),
                        Text(
                          "بدل :",
                          style: TextStyle(
                              color: textWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        Text(
                          "${snapshot.data!.docs[index].get("alternate")}",
                          style: TextStyle(
                            color: textWhiteColor,
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        SizedBox(height: 12),
                        Text(
                          "افعال :",
                          style: TextStyle(
                              color: textWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        Text(
                          "${snapshot.data!.docs[index].get("benefits")}",
                          style: TextStyle(
                            color: textWhiteColor,
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        SizedBox(height: 12),
                        Text(
                          "مقدار خوراک :",
                          style: TextStyle(
                              color: textWhiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                          textDirection: TextDirection.rtl
                        ),
                        Text(
                          "${snapshot.data!.docs[index].get("dosage")}",
                          style: TextStyle(
                            color: textWhiteColor,
                          ),
                          textDirection: TextDirection.rtl
                        ),
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
  Widget headerText(String text,){
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Text(
        "${text}",
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: textWhiteColor,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget dataText(String text){
    return Text(
      "${text}",
      textDirection: TextDirection.rtl,
      style: TextStyle(
        color: textWhiteColor,
      ),
    );
  }
}