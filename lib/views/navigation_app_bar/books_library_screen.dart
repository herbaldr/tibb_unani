import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../services/admob_ads.dart';
import '../../utils/colors.dart';
import 'library/mufridaat/mufridaat_index_screen.dart';
import 'library/murakkabaat/murakkabaat_index_screen.dart';

class BookLibraryScreen extends StatefulWidget {

  @override
  State<BookLibraryScreen> createState() => _BookLibraryScreenState();
}

class _BookLibraryScreenState extends State<BookLibraryScreen> {

  String book1Name = "كتاب المفردات";
  String book2Name = "كتاب المركبات";

  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdMobAds.libraryBannerAd(),
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
      // Body Of the middle Screen here...
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15)
        ),
        margin: EdgeInsets.only(top: 15, left: 12,right: 12),
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollBehavior().copyWith(overscroll: false),
                child: SingleChildScrollView(
                  // physics: ClampingScrollPhysics(),
                  // physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Get.to(MufridaatIndexScreen(bookName: book1Name));
                            },
                            child: customContainer("꧁𓊈𒆜☬1☬𒆜𓊉꧂", book1Name, "حکیم جنید اقبال"),
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(MurakkabaatIndexScreen(bookName: book2Name));
                            },
                            child: customContainer("꧁𓊈𒆜☬2☬𒆜𓊉꧂", book2Name, "حکیم جنید اقبال"),
                          )
                        ],
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              child: customContainer("꧁𓊈𒆜☬3☬𒆜𓊉꧂", "القانون", "حکیم جنید اقبال")
                          ),
                          InkWell(
                              child: customContainer("꧁𓊈𒆜☬4☬𒆜𓊉꧂", "اناٹومی","حکیم جنید اقبال")
                          )
                        ],
                      ),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              child: customContainer("꧁𓊈𒆜☬5☬𒆜𓊉꧂", "فزیالوجی", "حکیم جنید اقبال")
                          ),
                            // InkWell(
                            //     child: customContainer("كتاب", "اناٹومی", "مصنف", "حکیم جنید اقبال")
                            // )
                        ],
                      ),
                    ],
                  ),
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
      )
    );
  }

  // custom container built for multiple widgets...
  Widget customContainer(String bookText, String bookName, String writerName){
    return Container(
      height: Get.height*0.3,
      width: Get.width*0.44,
      decoration: BoxDecoration(
        color: secondPrimaryColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: kElevationToShadow[4],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "${bookText}",
            style: TextStyle(
                color: textWhiteColor,
                // fontWeight: FontWeight.bold,
                fontSize: Get.height*0.02
            ),
          ),
          Text(
            "${bookName}",
            style: TextStyle(
                color: textWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: Get.height*0.022
            ),
          ),
          Text(
            "${writerName}",
            style: TextStyle(
                color: textWhiteColor,
                fontWeight: FontWeight.bold,
                fontSize: Get.height*0.02
            ),
          ),
        ],
      ),
    );
  }
}



