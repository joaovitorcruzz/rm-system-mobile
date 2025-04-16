import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rm_systems_mobile/configs/environment_helper.dart';
import 'package:rm_systems_mobile/core/service/app_service.dart';
import 'package:rm_systems_mobile/core/service/storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> init() async {
  // #region EnvironmentHelper
  final IEnvironmentHelper environmentHelper = EnvironmentHelper();
  getIt.registerSingleton<IEnvironmentHelper>(environmentHelper);

  // Crie a instância de GlobalKey antes de registrar o AppService
  final navigatorKey = GlobalKey<NavigatorState>();

  // Registre o AppService passando o GlobalKey para o construtor
  getIt.registerSingleton<IAppService>(AppService(navigatorKey));

  // #region StorageService
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<IStorageService>(StorageService(sharedPreferences));
}
