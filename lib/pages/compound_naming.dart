// ignore_for_file: unused_field
import 'package:flutter/material.dart';
import 'package:chimicapp/widgets/text_filed.dart';
import 'package:chimicapp/widgets/table.dart';
import 'package:chimicapp/widgets/footer.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// ignore: must_be_immutable
class MyCompoundNamingPage extends StatefulWidget {
  const MyCompoundNamingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyCompoundNamingPageState();
}

class _MyCompoundNamingPageState extends State<MyCompoundNamingPage> {
  late BannerAd _banner;
  bool _isAdLoaded = false;

  void _createBannerAd() {
    _banner = BannerAd(
      size: AdSize.banner,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      listener: BannerAdListener(
        onAdLoaded: (ad) => setState(
          () {
            _isAdLoaded = true;
            // ignore: avoid_print
            print("Successfully loaded Ad: ${ad.adUnitId}");
          },
        ),
        onAdFailedToLoad: (ad, error) =>
            // ignore: avoid_print
            print("Failed to load Ad: ${ad.adUnitId}, $error"),
      ),
      request: const AdRequest(),
    );
  }

  @override
  void initState() {
    super.initState();
    _createBannerAd();
    if (_isAdLoaded == true) _banner.load();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const MyTextField(
            inputLenghtLimit: 255,
            myHintText:
                "Inserisci il composto ... (Spazia gli elementi, e.g. 'H2 O')",
          ),
          const MyTable(),
          const Spacer(),
          if (_isAdLoaded == true)
            SizedBox(
              height: 50,
              child: AdWidget(ad: _banner),
            )
          else
            const SizedBox(
              height: 50,
            ),
          const MyFooter(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
