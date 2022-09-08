// import 'package:chimicapp/AdMob/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:chimicapp/widgets/text_filed.dart';
import 'package:chimicapp/widgets/table.dart';
// import 'package:provider/provider.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// ignore: must_be_immutable
class MyCompoundNamingPage extends StatefulWidget {
  const MyCompoundNamingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyCompoundNamingPageState();
}

class _MyCompoundNamingPageState extends State<MyCompoundNamingPage> {
  // late BannerAd _banner;
  // bool? _isAdLoaded;

  void _createBannerAd() {
    // _banner = BannerAd(
    //   size: AdSize.banner,
    //   adUnitId: Provider.of<MyAdState>(context).bannerAdUnitId,
    //   listener: Provider.of<MyAdState>(context).listener,
    //   request: const AdRequest(),
    // )..load();
    // _isAdLoaded = true;
  }

  @override
  void initState() {
    super.initState();
    _createBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          MyTextField(
            inputLenghtLimit: 255,
            myHintText:
                "Inserisci il composto ... (Spazia gli elementi, e.g. 'H2 O')",
          ),
          MyTable(),
          Spacer(),
          // if (_isAdLoaded == true)
          //   SizedBox(
          //     height: 50,
          //     child: AdWidget(ad: _banner),
          //   )
          // else
          //   const SizedBox(
          //     height: 50,
          //   ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
