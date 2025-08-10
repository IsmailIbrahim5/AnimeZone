import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager with ChangeNotifier{
  static final AdManager _instance = AdManager._internal();
  factory AdManager() => _instance;
  AdManager._internal();

  final Map<String, BannerAd?> _loadedAds = {};
  final Map<String, bool> _isLoaded = {};

  BannerAd? getBanner(String screenName) => _loadedAds[screenName];
  bool isLoaded(String key) => _isLoaded[key] == true;

  void loadBanner(String screenName) {
    if (_loadedAds.containsKey(screenName)) return;

    final ad = BannerAd(
      adUnitId: adUnitsIds[screenName]!,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          _isLoaded[screenName] = true;
          notifyListeners();
        },
        onAdFailedToLoad: (_, error) {
          print('$screenName ad failed: $error');
        },
      ),
    );


    _loadedAds[screenName] = ad;
    _isLoaded[screenName] = false;
    ad.load();
  }


  final Map<String, String> adUnitsIds = {
    'category': 'ca-app-pub-7278362295278978/6479377893',
    'news': 'ca-app-pub-7278362295278978/6626787364',
    'review': 'ca-app-pub-7278362295278978/6892420790',
    'full_details': 'ca-app-pub-7278362295278978/5313705697',
    'collection': 'ca-app-pub-7278362295278978/8598344580',
    'news_collection': 'ca-app-pub-7278362295278978/8863978019',
    'character': 'ca-app-pub-7278362295278978/4409727680'
  };
}