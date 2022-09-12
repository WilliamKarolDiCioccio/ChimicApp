import 'package:chimicapp/providers/compound.dart';
import 'package:chimicapp/providers/theme.dart';
import 'package:chimicapp/screens/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:chimicapp/constants.dart';
import 'package:chimicapp/screens/home.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeModel()),
        ChangeNotifierProvider(create: (context) => CompoundModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> _initPlatformState() async {
    try {} finally {}

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: kDebugMode,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Constants.kPrimarySwatch,
        primaryColor: Constants.kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Nexa',
        platform: TargetPlatform.android,
      ),
      title: 'ChimicApp',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHome(),
        '/settings': (context) => const MySettings(),
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
