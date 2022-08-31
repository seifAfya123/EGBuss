// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/business_logic/bloc_observer.dart';
import 'package:testapp/business_logic/global_cubit/global_cubit.dart';
import 'package:testapp/business_logic/login_cubit/login_cubit.dart';
import 'package:testapp/business_logic/register_cubit/register_cubit.dart';
import 'package:testapp/business_logic/seat_reserver_cubit/seat_reserver_cubit.dart';
import 'package:testapp/constants/app_strings.dart';
import 'package:testapp/constants/language_manager.dart';
import 'package:testapp/data/local/cache_helper.dart';
import 'package:testapp/presentation/router/app_router.dart';
import 'package:testapp/presentation/router/rout_names_dart.dart';
import 'package:testapp/presentation/styles/my_theme_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:sizer/sizer.dart';

String cash = "";
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: MyThemeData.appblue,
    statusBarIconBrightness: Brightness.dark,
  ));

  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  cash = CacheHelper.getDataFromSharedPreference(key: AppStrings.theme) ??
      AppStrings.light;
  CacheHelper.saveDataSharedPreference(key: AppStrings.theme, value: cash);
  CacheHelper.saveDataSharedPreference(
    key: AppStrings.fatoraNumber,
    value:
        CacheHelper.getDataFromSharedPreference(key: AppStrings.fatoraNumber) ??
            1,
  );

  // Bloc.transformer = (events, mapper) {
  //   runApp(EasyLocalization(
  //     supportedLocales: const [arabicLocal, englishLocal],
  //     path: assetPathLocalizations,
  //     child: Phoenix(child: MyApp(appRouter: AppRouter())),
  //   ));
  //   return events;
  // };
  // Bloc.observer = MyBlocObserver();

  // =CustomBlocObserver(runApp(EasyLocalization(
  //   supportedLocales: const [arabicLocal, englishLocal],
  //   path: assetPathLocalizations,
  //   child: Phoenix(child: MyApp(appRouter: AppRouter())),
  // )));
  
  BlocOverrides.runZoned(
    () async {
      runApp(EasyLocalization(
        supportedLocales: const [arabicLocal, englishLocal],
        path: assetPathLocalizations,
        child: Phoenix(child: MyApp(appRouter: AppRouter())),
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({required this.appRouter, Key? key}) : super(key: key);
  final AppRouter appRouter;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    LanguageManager.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => GlobalCubit())),
        BlocProvider(create: ((context) => LoginCubit())),
        BlocProvider(create: ((context) => RegisterCubit())),
        BlocProvider(create: ((context) => SeatReserverCubit())),
      ],
      child: BlocConsumer<GlobalCubit, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return LayoutBuilder(builder: (context, constraints) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  onGenerateRoute: widget.appRouter.onGenerateRoute,
                  initialRoute: RoutNamesDart.rSplashScreen,
                  theme: MyThemeData.lightTheme,
                  darkTheme: MyThemeData.darkTheme,
                  themeMode: CacheHelper.getDataFromSharedPreference(
                              key: AppStrings.theme) ==
                          AppStrings.light
                      ? ThemeMode.light
                      : ThemeMode.dark,
                );
              });
            },
          );
        },
      ),
    );
  }
}
