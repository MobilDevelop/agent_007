import 'package:agent_007/presentation/pages/add_expenses/add_expenses_page.dart';
import 'package:agent_007/presentation/pages/home/home_page.dart';
import 'package:agent_007/presentation/pages/registration/registration_page.dart';
import 'package:agent_007/presentation/pages/security/security_page.dart';
import 'package:agent_007/presentation/pages/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'entity/routes.dart';

//final localSource = inject<LocalSource>();

final GoRouter router = GoRouter(
    initialLocation: Routes.splashscreen.path,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        name: Routes.splashscreen.name,
        path: Routes.splashscreen.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const SplashScreen(),
        ),
      ), 
      GoRoute(
        name: Routes.security.name,
        path: Routes.security.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const SecurityPage(),
        ),
      ),
      GoRoute(
        name: Routes.addexpenses.name,
        path: Routes.addexpenses.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const AddExpensesPage(),
        ),
      ),
      GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const HomePage(),
        ),
      ),
      GoRoute(
        name: Routes.registration.name,
        path: Routes.registration.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const RegistrationPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const SizedBox());
