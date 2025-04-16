import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// import 'package:rm_systems_mobile/configs/injection_container.dart';
import 'package:rm_systems_mobile/routing/route_generator.dart';
import 'package:rm_systems_mobile/core/service/app_service.dart';
import 'package:rm_systems_mobile/core/service/clock_helper.dart';
import 'package:rm_systems_mobile/core/service/storage_service.dart';
import 'package:rm_systems_mobile/data/datasources/core/non_relational_datasource.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:rm_systems_mobile/ui/profile/view_models/user_viewmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>(); // Criada aqui

Future<void> setupGetIt() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerSingleton<IAppService>(AppService(navigatorKey)); // Corrigido aqui
  getIt.registerSingleton<IStorageService>(StorageService(sharedPreferences));
  getIt.registerSingleton<IClockHelper>(ClockHelper());
  getIt.registerSingleton<NonRelationalDataSource>(
    NonRelationalDataSource(
      getIt<IStorageService>(),
      getIt<IClockHelper>(),
    ),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupGetIt(); // Corrigido aqui
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('pt', 'BR')],
      onGenerateRoute: RouteGeneratorHelper.generateRoute,
      navigatorKey: getIt<IAppService>().navigatorKey,
      initialRoute: RouteGeneratorHelper.kLogin,
    );
  }
}
