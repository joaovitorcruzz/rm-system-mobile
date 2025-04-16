import 'package:flutter/material.dart';
import 'package:rm_systems_mobile/configs/injection_container.dart';
import 'package:rm_systems_mobile/core/service/app_service.dart';

void showSnackBar(String description) {
  final SnackBar snackBar = SnackBar(
    content: Text(description),
    duration: const Duration(seconds: 3),
  );
  final BuildContext? context = getIt<IAppService>().context;
  if (context != null) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}