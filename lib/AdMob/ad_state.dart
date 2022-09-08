// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MyAdState {
  final Future<InitializationStatus> initialization;

  MyAdState(this.initialization);

  final BannerAdListener listener = BannerAdListener(
    onAdLoaded: (ad) => print("Successfully loaded Ad: ${ad.adUnitId}"),
    onAdFailedToLoad: (ad, error) =>
        print("Failed to load Ad: ${ad.adUnitId}, $error"),
  );

  final String bannerAdUnitId = kDebugMode == true
      ? "ca-app-pub-3940256099942544/6300978111"
      : "ca-app-pub-7145072833582688/7192822362";
}

// ca-app-pub-7145072833582688/7192822362