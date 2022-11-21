import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../../services/admob_ads.dart';
import '../../../../utils/colors.dart';
import '../../../../widgets/text_styles.dart';

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

  List<bool> _isExpanded = [
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
    false, false, false, false, false, false, false, false, false, false,
  ];

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdMobAds.mufridaatPostBannerAd(),
      // adUnitId: BannerAd.testAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("${widget.indexName}"),
        centerTitle: true,
        backgroundColor: secondPrimaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
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
                  return snapshot.hasData == null ? Center(
                    child: Text(
                      "No Data",
                      style: TextStyle(
                        color: appWhiteColor
                      ),
                    ),
                  ) :
                  ScrollConfiguration(
                    behavior: ScrollBehavior().copyWith(overscroll: false),
                    child: ListView.builder(
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
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: ExpansionPanelList(
                              animationDuration: Duration(milliseconds: 300),
                              dividerColor: secondaryColor,
                              elevation: 0,
                              expansionCallback: (i, isExpanded){
                                setState(() {
                                  _isExpanded[index] = !isExpanded;
                                });
                              },
                              children: [
                                ExpansionPanel(
                                  canTapOnHeader: true,
                                  backgroundColor: secondPrimaryColor,
                                  headerBuilder: (context,isExpanded){
                                    return Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "${index+1}.  ${snapshot.data!.docs[index].get("title")}",
                                        style: TextStyle(
                                          color: appWhiteColor,
                                          fontSize: 26,
                                        ),
                                      ),
                                    );
                                  },
                                  isExpanded: _isExpanded[index],
                                  body: Container(
                                    decoration: BoxDecoration(
                                      color: secondPrimaryColor,
                                    ),
                                    padding: EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        headerText("دیگر نام :"),
                                        // text for other name data..
                                        dataText("${snapshot.data!.docs[index].get("otherNames")}"),
                                        SizedBox(height: 12),
                                        headerText("شناخت :"),
                                        dataText("${snapshot.data!.docs[index].get("identification")}"),
                                        SizedBox(height: 12),
                                        headerText("مقام پیدائش :"),
                                        dataText("${snapshot.data!.docs[index].get("whereToFind")}"),
                                        SizedBox(height: 12),
                                        headerText("مزاج :"),
                                        dataText("${snapshot.data!.docs[index].get("modOfAction")}"),
                                        SizedBox(height: 12),
                                        headerText("مضر :"),
                                        dataText("${snapshot.data!.docs[index].get("harmful")}"),
                                        SizedBox(height: 12),
                                        headerText("مصلح :"),
                                        dataText("${snapshot.data!.docs[index].get("improve")}"),
                                        SizedBox(height: 12),
                                        headerText("بدل :"),
                                        dataText("${snapshot.data!.docs[index].get("alternate")}"),
                                        SizedBox(height: 12),
                                        headerText("افعال :"),
                                        dataText("${snapshot.data!.docs[index].get("benefits")}"),
                                        SizedBox(height: 12),
                                        headerText("مقدار خوراک :"),
                                        dataText("${snapshot.data!.docs[index].get("dosage")}"),
                                      ],
                                    ),
                                  ),

                                )
                              ],
                            ),
                          ),
                        );
                      }
                    ),
                  );
                }
              ),
            ),
          ),
          _isBannerAdReady != true? Container(): Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: _bannerAd.size.width.toDouble(),
              height: _bannerAd.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
          )
        ],
      ),
    );
  }
}