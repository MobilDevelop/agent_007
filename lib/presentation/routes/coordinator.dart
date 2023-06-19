// Created by Muhammed Tolkinov on 16-September-2022

import 'package:agent_007/presentation/pages/home/home_page.dart';
import 'package:agent_007/presentation/pages/login/login_page.dart';
import 'package:agent_007/presentation/pages/registration/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'entity/routes.dart';

//final localSource = inject<LocalSource>();

final GoRouter router = GoRouter(
    initialLocation: Routes.home.path,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        name: Routes.home.name,
        path: Routes.home.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const HomePage(),
        ),
      ),
      GoRoute(
        name: Routes.login.name,
        path: Routes.login.path,
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const LoginPage(),
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

CustomTransitionPage _customTransitionPage({
  required Widget child,
  required ValueKey<String> key,
}) {
  return CustomTransitionPage(
    key: key,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0, 1);
      const end = Offset.zero;
      const curve = Curves.ease;

      final tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
