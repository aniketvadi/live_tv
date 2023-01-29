import 'dart:convert';

import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;

class AdHelper {
  static bool isBannerAdLoaded = false;
  static bool isNativeAdLoaded = false;
  // static List<AdmobModal> admobDataList = [];
  // static List<ApplovinAdModal> applovinDataList = [];
  static List adDataList = [];
  static bool isGoogleAdmob = false;
  static bool isAppLovin = false;
  static int interstialCount = 0;
  static int currentInterstialCount = 0;
  static String bannerId = '';
  static String interstitialId = '';
  static String nativeId = '';
  static String rewardedId = '';
  static BannerAd? bannerAd;
  static InterstitialAd? interstitialAd;
  static RewardedAd? rewardedAd;

  static Future<void> initializeAdMobDataAPI() async {
    Uri url = Uri.parse(
        'https://mesmarttechno.in/flutter_app/fetch_app_data.php?id=8');

    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      adDataList = jsonDecode(response.body);
      var adIDList = jsonDecode(adDataList.first['ad_id']);
      bannerId = adIDList['banner'];
      nativeId = adIDList['native'];
      interstitialId = adIDList['inter'];
      rewardedId = adIDList['rewarded'];
      interstialCount = int.parse(adDataList.first['ad_count']);
      print(adDataList.first['ad_types']);
      initializeAllParameter();
    } else {
      print('something went wrong');
    }
  }

  static initializeAllParameter() async {
    if (adDataList.first['ad_types'] == 'adx') {
      isGoogleAdmob = true;
    } else if (adDataList.first['ad_types'] == 'applovin') {
      isAppLovin = true;
    }

    if (isGoogleAdmob) {
      await loadBannerAd();
      await loadNativeAd();
      await loadIntersrtitialAd();
      await loadRewardedAd();
    }
    await initializeApplovinSDK();
  }

  static Future initializeApplovinSDK() async {
    if (isAppLovin == true) {
      Map? sdkConfiguration = await AppLovinMAX.initialize(
          'zcTU2ZtqC3uleiZxA3uW8N1yt_CLOieJ8NcKwKt7gMsw1_S40uvbANLtB9KWgBJONFv9k953SAuVnDSdWsxEqb');
      print('AppLovin SDK Initialize succesfully');
      initializeApplovinInterstitialAds();
      initializeRewardedAds();
    }
  }

  static Future<void> loadBannerAd() async {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: bannerId,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            isBannerAdLoaded = true;
          },
          onAdFailedToLoad: (ad, error) {
            isBannerAdLoaded = false;
            loadBannerAd();
          },
        ),
        request: const AdRequest());
    bannerAd!.load();
  }

  static Future<void> loadNativeAd() async {
    bannerAd = BannerAd(
        size: AdSize.mediumRectangle,
        adUnitId: bannerId,
        listener: BannerAdListener(
          onAdLoaded: (ad) {
            isNativeAdLoaded = true;
          },
          onAdFailedToLoad: (ad, error) {
            isNativeAdLoaded = false;
            loadNativeAd();
          },
        ),
        request: const AdRequest());
    bannerAd!.load();
  }

  static Future<void> loadIntersrtitialAd() async {
    InterstitialAd.load(
        adUnitId: interstitialId,
        request: const AdRequest(),
        adLoadCallback:
            InterstitialAdLoadCallback(onAdLoaded: (InterstitialAd ad) {
          interstitialAd = ad;
        }, onAdFailedToLoad: (error) {
          loadIntersrtitialAd();
        }));
  }

  static loadRewardedAd() {
    RewardedAd.load(
      adUnitId: rewardedId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              loadRewardedAd();
            },
          );
          rewardedAd = ad;
        },
        onAdFailedToLoad: (err) {
          showRewardedAd();
          print('Failed to load a rewarded ad: ${err.message}');
        },
      ),
    );
  }

  static Widget bannerAdWidget() {
    if (isGoogleAdmob) {
      loadBannerAd();
      return isBannerAdLoaded
          ? SizedBox(
              height: bannerAd!.size.height.toDouble(),
              width: bannerAd!.size.width.toDouble(),
              child: AdWidget(
                ad: bannerAd!,
                key: UniqueKey(),
              ),
            )
          : const SizedBox();
    } else if (isAppLovin == true) {
      return MaxAdView(
          adUnitId: bannerId,
          adFormat: AdFormat.banner,
          listener: AdViewAdListener(
              onAdLoadedCallback: (ad) {},
              onAdLoadFailedCallback: (adUnitId, error) {},
              onAdClickedCallback: (ad) {},
              onAdExpandedCallback: (ad) {},
              onAdCollapsedCallback: (ad) {}));
    }
    return SizedBox();
  }

  static Widget nativeAdWidget() {
    if (isGoogleAdmob) {
      loadNativeAd();
      return isNativeAdLoaded
          ? Container(
              height: bannerAd!.size.height.toDouble(),
              width: bannerAd!.size.width.toDouble(),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
              ),
              child: AdWidget(
                ad: bannerAd!,
                key: UniqueKey(),
              ),
            )
          : const SizedBox();
    } else if (isAppLovin == true) {
      return MaxAdView(
          adUnitId: nativeId,
          adFormat: AdFormat.mrec,
          listener: AdViewAdListener(
              onAdLoadedCallback: (ad) {},
              onAdLoadFailedCallback: (adUnitId, error) {},
              onAdClickedCallback: (ad) {},
              onAdExpandedCallback: (ad) {},
              onAdCollapsedCallback: (ad) {}));
    }
    return SizedBox();
  }

  static void initializeApplovinInterstitialAds() {
    AppLovinMAX.setInterstitialListener(InterstitialListener(
      onAdLoadedCallback: (ad) {
        // Interstitial ad is ready to be shown. AppLovinMAX.isInterstitialReady(_interstitial_ad_unit_id) will now return 'true'
        print('Interstitial ad loaded from ' + ad.networkName);
      },
      onAdLoadFailedCallback: (adUnitId, error) {
        AppLovinMAX.loadInterstitial(interstitialId);
      },
      onAdDisplayedCallback: (ad) {
        AppLovinMAX.loadInterstitial(interstitialId);
      },
      onAdDisplayFailedCallback: (ad, error) {},
      onAdClickedCallback: (ad) {},
      onAdHiddenCallback: (ad) {
        AppLovinMAX.loadInterstitial(interstitialId);
      },
    ));

    // Load the first interstitial
    AppLovinMAX.loadInterstitial(interstitialId);
    AppLovinMAX.showInterstitial(interstitialId);
  }

  static initializeRewardedAds() {
    AppLovinMAX.setRewardedAdListener(RewardedAdListener(
        onAdLoadedCallback: (ad) {
          print('Rewarded ad loaded from ' + ad.networkName);
        },
        onAdLoadFailedCallback: (ad, error) {
          AppLovinMAX.loadRewardedAd(rewardedId);
        },
        onAdDisplayedCallback: (ad) {},
        onAdDisplayFailedCallback: (ad, error) {},
        onAdClickedCallback: (ad) {},
        onAdHiddenCallback: (ad) {},
        onAdReceivedRewardCallback: (ad, reward) {
          AppLovinMAX.loadRewardedAd(rewardedId);
        }));

    AppLovinMAX.loadRewardedAd(rewardedId);
    AppLovinMAX.showRewardedAd(rewardedId);
  }

  static Future showIntersrtitialAd() async {
    if (interstialCount >= currentInterstialCount) {
      currentInterstialCount = currentInterstialCount + 1;
      if (isGoogleAdmob) {
        if (interstitialAd != null) {
          interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              interstitialAd?.dispose();
              loadIntersrtitialAd();
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
              loadIntersrtitialAd();
            },
          );
          interstitialAd?.show();
        }
      } else if (isAppLovin == true) {
        initializeApplovinInterstitialAds();
      }
    }
  }

  static Future showRewardedAd() async {
    if (isGoogleAdmob) {
      if (rewardedAd != null) {
        loadRewardedAd();
        rewardedAd!.show(onUserEarnedReward: (ad, reward) {});
      }
    } else if (isAppLovin == true) {
      initializeRewardedAds();
    }
  }
}
