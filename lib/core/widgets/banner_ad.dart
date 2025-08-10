import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../utils/ad_manager.dart';

class MyBannerAd extends StatefulWidget {
  final String screenName;
  const MyBannerAd({super.key, required this.screenName});

  @override
  State<MyBannerAd> createState() => _MyBannerAdState();
}

class _MyBannerAdState extends State<MyBannerAd> {
  @override
  void initState() {
    super.initState();
    AdManager().loadBanner(widget.screenName);
    AdManager().addListener(_adListener);

  }
  void _adListener() {
    if (AdManager().isLoaded('category')) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    AdManager().removeListener(_adListener);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final ad = AdManager().getBanner(widget.screenName);
    if(ad != null && AdManager().isLoaded(widget.screenName)) {
      return SizedBox(
        width: ad.size.width.toDouble(),
        height: ad.size.height.toDouble(),
        child: AdWidget(ad: ad),
      );
    }else{
      return const SizedBox();
    }
  }
}