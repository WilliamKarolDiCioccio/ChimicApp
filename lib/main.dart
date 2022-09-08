// ignore_for_file: import_of_legacy_library_into_null_safe
// import 'package:chimicapp/AdMob/ad_state.dart';
import 'package:chimicapp/providers/compound_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:chimicapp/constants.dart';
import 'package:chimicapp/screens/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // final initState = MobileAds.instance.initialize();
  // final adState = MyAdState(initState);

  runApp(
    MultiProvider(
      providers: [
        // Provider(create: (context) => adState),
        ChangeNotifierProvider(create: (context) => CompoundProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

Future initialization(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: kPrimarySwatch,
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Nexa',
      ),
      title: 'ChimicApp',
      home: const MyHome(),
    );
  }
}
