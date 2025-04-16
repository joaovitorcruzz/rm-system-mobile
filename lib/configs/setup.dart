import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_systems_mobile/core/helpers/clock_helper.dart';
import 'package:rm_systems_mobile/core/helpers/environment_helper.dart';
import 'package:rm_systems_mobile/core/service/app_service.dart';

final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<IAppService>(AppService(GlobalKey<NavigatorState>()));
  getIt.registerSingleton<IEnvironmentHelper>(const EnvironmentHelper());
  getIt.registerSingleton<IClockHelper>(const ClockHelper());
}