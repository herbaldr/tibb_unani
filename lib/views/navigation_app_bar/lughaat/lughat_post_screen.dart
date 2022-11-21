import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../services/admob_ads.dart';
import '../../../utils/colors.dart';
import '../../../widgets/text_styles.dart';

class LughaatPostScreen extends StatefulWidget {
  late String documentId;
  late String indexName;
  LughaatPostScreen({
    required this.documentId,
    required this.indexName
});
  @override
  State<LughaatPostScreen> createState() => _LughaatPostScreenState();
}

class _LughaatPostScreenState extends State<LughaatPostScreen> {

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdMobAds.lughaatBannerAd(),
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
              margin: EdgeInsets.all(15),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('lughat').doc(widget.documentId).collection("post").snapshots(),
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
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // text for index no of medicine...
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "۩۞ ${snapshot.data!.docs[index].get("title")} ۞۩",
                                        style: largeTextStyle(),
                                      ),
                                    ],
                                  ),
                                  headerText("معنی :"),
                                  Text(
                                    "${snapshot.data!.docs[index].get("meaning")}",
                                    style: mediumTextStyle(),
                                  ),
                                  headerText("تفصیل :"),
                                  Text(
                                    "${snapshot.data!.docs[index].get("description")}",
                                    style: mediumTextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
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
