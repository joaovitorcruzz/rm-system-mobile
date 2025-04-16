import 'package:flutter/material.dart';

abstract interface class IAppService {
  GlobalKey<NavigatorState> get navigatorKey;

  BuildContext? get context => null;
  void navigateNamedReplacementTo(String routeName);
}

final class AppService implements IAppService {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  // O construtor precisa receber o GlobalKey<NavigatorState>
  AppService(this.navigatorKey);

  @override
  void navigateNamedReplacementTo(String routeName) {
    navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  @override
  BuildContext? get context => throw UnimplementedError();
}
