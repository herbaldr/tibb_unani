import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../services/admob_ads.dart';
import '../../../utils/colors.dart';
import '../../../widgets/text_styles.dart';
import 'hakeem_panel_index_screen.dart';

class HakeemPanelScreen extends StatefulWidget {

  @override
  State<HakeemPanelScreen> createState() => _HakeemPanelScreenState();
}

class _HakeemPanelScreenState extends State<HakeemPanelScreen> {

  Stream<QuerySnapshot<Map<String, dynamic>>> _stream = FirebaseFirestore.instance.collection('mujarrabaat_e_tabib').snapshots();

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdMobAds.hakeemPanelBannerAd(),
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
      body: Column(
        children: [
          Expanded(
            child: Container(
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
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    margin: EdgeInsets.only(left: 12, right: 12, bottom: 12, top: 15),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){
                          return InkWell(
                            onTap: (){
                              Get.to(HakeemPanelIndexScreen(
                                documentId: snapshot.data!.docs[index].id,
                                title: snapshot.data!.docs[index].get("title"),
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 18),
                              height: Get.height*0.18,
                              decoration: BoxDecoration(
                                color: secondPrimaryColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: kElevationToShadow[4],
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: Get.width*0.05),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: Get.height*0.12,
                                        width: Get.height*0.12,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.circular(60),
                                            border: Border.all(
                                                width: 1,
                                                color: secondaryColor
                                            )
                                        ),
                                        padding: EdgeInsets.all(6),
                                        child: CircleAvatar(
                                          radius: Get.height*0.18,
                                          backgroundImage: NetworkImage("${snapshot.data!.docs[index].get("image")}"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Get.width*0.05),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "مجربات : ",
                                            style: largeTextStyle(),
                                          ),
                                          Text(
                                            "${snapshot.data!.docs[index].get("title")}",
                                            style: mediumTextStyle(),
                                          )
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "خدمت کے ",
                                            style: largeTextStyle(),
                                          ),
                                          Text(
                                            "${snapshot.data!.docs[index].get("experience")}",
                                            style: largeTextStyle(),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Get.width*0.05,)
                                ],
                              ),
                            ),
                          );
                        }
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
          SizedBox(height: 8),
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
