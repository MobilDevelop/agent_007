import 'coordinate.dart';

/// A set of routes for the entire app.
class Routes implements Coordinate {
  const Routes._({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  static const home = Routes._(
    name: 'home_page',
    path: '/home',
  );
  static const splashscreen = Routes._(
    name: 'splash_page',
    path: '/splash',
  );
  static const login = Routes._(
    name: 'login_page',
    path: '/login',
  );
  static const registration = Routes._(
    name: 'registration_page',
    path: '/registration',
  );
  static const addexpenses = Routes._(
    name: 'add_expenses_page',
    path: '/sadd_expenses',
  );

  @override
  String toString() => 'name=$name, path=$path';
}
