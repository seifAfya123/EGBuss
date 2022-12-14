// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:testapp/business_logic/bloc_observer.dart';
import 'package:testapp/business_logic/global_cubit/global_cubit.dart';
import 'package:testapp/business_logic/login_cubit/login_cubit.dart';
import 'package:testapp/business_logic/payment_cubit/payment_cubit.dart';
import 'package:testapp/business_logic/provider/user_guest_provider.dart';
import 'package:testapp/business_logic/register_cubit/register_cubit.dart';
import 'package:testapp/business_logic/seat_reserver_cubit/seat_reserver_cubit.dart';
import 'package:testapp/constants/app_strings.dart';
import 'package:testapp/constants/end_points.dart';
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
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  cash = CacheHelper.getDataFromSharedPreference(key: AppStrings.theme) ??
      AppStrings.light;
  CacheHelper.saveDataSharedPreference(key: AppStrings.theme, value: cash);
  // var x=CacheHelper.getDataFromSharedPreference(key: appLanguageSharedKey) ?? LanguageManager.getAppLanguage().then((value) => value.toString());
  // CacheHelper.getDataFromSharedPreference(key: appLanguageSharedKey) == 'ar'
  //     ? CacheHelper.saveDataSharedPreference(
  //         key: appLanguageSharedKey, value: null)
  //     : null;

  var x = CacheHelper.getDataFromSharedPreference(key: appLanguageSharedKey) ??
      LanguageManager.getAppLanguage().then((value) => value.toString());
  CacheHelper.saveDataSharedPreference(key: appLanguageSharedKey, value: 'ar');

  print(CacheHelper.getDataFromSharedPreference(key: appLanguageSharedKey));
  runApp(EasyLocalization(
    supportedLocales: const [arabicLocal, englishLocal],
    path: assetPathLocalizations,
    child: Phoenix(child: MyApp(appRouter: AppRouter())),
  ));
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
    return MultiProvider(
      providers: [
        BlocProvider(create: ((context) => GlobalCubit())),
        BlocProvider(create: ((context) => LoginCubit())),
        BlocProvider(create: ((context) => RegisterCubit())),
        BlocProvider(create: ((context) => SeatReserverCubit())),
        BlocProvider(create: ((context) => PaymentMethodCubit())),
        ChangeNotifierProvider(create: (_) => user_guest()),
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
