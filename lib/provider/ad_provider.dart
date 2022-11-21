import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tibb_unani/services/admob_ads.dart';


class AdsProvider with ChangeNotifier{

  bool isFirstBannerAdLoaded = false;
  late BannerAd firstBannerAd;

  bool isHakeemPanelBanerAdLoaded = false;
  late BannerAd hakeemPanelBannerAd;

  bool isHomePageInterstitialAdLoaded = false;
  late InterstitialAd homePageInterstitialAd;

  /// First BannerAd...
  void initializefirstBannerAd () async {
    firstBannerAd = BannerAd(
      size: AdSize.banner,
      // adUnitId: adMobAds.firstBannerAd(),
      adUnitId: BannerAd.testAdUnitId,
      request: AdRequest(),
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            isFirstBannerAdLoaded = true;
          },
          onAdClosed: (ad){
            ad.dispose();
            isFirstBannerAdLoaded = false;
          },
          onAdFailedToLoad: (ad, error){
            print(error.toString());
            isFirstBannerAdLoaded = false;
          }
      ),
    );
    await firstBannerAd.load();

    notifyListeners();
  }

  /// Hakeem panel banner add code set_up...
  void initializeHakeemPanelBannerAd () async {
    hakeemPanelBannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdMobAds.hakeemPanelBannerAd(),
      // adUnitId: BannerAd.testAdUnitId,
      request: AdRequest(),
      listener: BannerAdListener(
          onAdLoaded: (ad) {
            isHakeemPanelBanerAdLoaded = true;
          },
          onAdClosed: (ad){
            ad.dispose();
            isHakeemPanelBanerAdLoaded = false;
          },
          onAdFailedToLoad: (ad, error){
            print(error.toString());
            isHakeemPanelBanerAdLoaded = false;
          }
      ),
    );
    await hakeemPanelBannerAd.load();

    notifyListeners();
  }

  void initializeHomePageInterstitialAd () async {
    await InterstitialAd.load(
        // adUnitId: adMobAds.homePageInterstitialAd(),
        adUnitId: InterstitialAd.testAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            homePageInterstitialAd = ad;
            isHomePageInterstitialAdLoaded = true;
          },
          onAdFailedToLoad: (error){
            print(error.toString());
            isHomePageInterstitialAdLoaded = false;
          },

        )
    );
    notifyListeners();
  }

}