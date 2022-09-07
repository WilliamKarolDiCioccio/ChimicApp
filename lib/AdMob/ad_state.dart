import 'package:permission_handler/permission_handler.dart';

class MyAdState {
  final Future<PermissionStatus> initialization;

  const MyAdState({required this.initialization});

  static const String bannerAdUnitId = "ca-app-pub-3940256099942544/6300978111";
}

// ca-app-pub-7145072833582688/7192822362