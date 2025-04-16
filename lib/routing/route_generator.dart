import 'package:flutter/material.dart';
import 'package:rm_systems_mobile/ui/login_page.dart';
import 'package:rm_systems_mobile/ui/room_page.dart';

class RouteGeneratorHelper {
  static const String kLogin = '/login';
  static const String kHome = '/home';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kLogin:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case kHome:
        return MaterialPageRoute(builder: (_) => const RoomPage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }
}