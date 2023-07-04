import 'dart:async';
import 'package:agent_007/aplication/add_expenses/add_expenses_cubit.dart';
import 'package:agent_007/aplication/app_manager/app_manager_cubit.dart';
import 'package:agent_007/aplication/registration/registration_cubit.dart';
import 'package:agent_007/aplication/settings/settings_cubit.dart';
import 'package:agent_007/presentation/pages/app_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'infrasutruktura/common/app_init.dart';

Future<void> main() async {
  await runZonedGuarded<Future<void>>(() async {
    await initializeApp();

    runApp(
      EasyLocalization(
        supportedLocales: const [Locale('en')],
        useFallbackTranslations: true,
        useOnlyLangCode: true,
        fallbackLocale: const Locale('en'),
        path: 'assets/translations',
        child: const MyApp(),
      ),
    );
  }, (error, stack) {});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppManagerCubit>(
              create: (context) => AppManagerCubit()..init()),  
          BlocProvider(create: (context) => RegistrationCubib()),
          BlocProvider(create: (context) => AddExpensesCubit()),
          BlocProvider(create: (context) => SettingsCubit()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => const AppWidget(),
        ));
  }
}
