import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../../../services/admob_ads.dart';
import '../../../../utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'mufridaat_post_screen.dart';

class MufridaatIndexScreen extends StatefulWidget {

  String bookName;
  MufridaatIndexScreen({required this.bookName});

  @override
  State<MufridaatIndexScreen> createState() => _MufridaatIndexScreenState();
}

class _MufridaatIndexScreenState extends State<MufridaatIndexScreen> {

  Stream<QuerySnapshot<Map<String, dynamic>>> _stream = FirebaseFirestore.instance.collection('mufridaat').snapshots();

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdMobAds.mufridaatIndexBannerAd(),
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
      // App Bar starting from here...
      appBar: AppBar(
        title: Text("${widget.bookName}"),
        centerTitle: true,
        backgroundColor: secondPrimaryColor,
      ),

      // Body Of the middle Screen here...
      body: Column(
        children: [
          Expanded(
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
                    child: ScrollConfiguration(
                      behavior: ScrollBehavior().copyWith(overscroll: false),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
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
                    )
                  ),
                );
              }
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



