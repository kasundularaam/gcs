import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/exceptions/route_exception.dart';
import '../../logic/cubit/auth_cubit/auth_cubit.dart';
import '../../logic/cubit/landing_cubit/landing_cubit.dart';
import '../auth_screen/auth_page.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/landing_screen/landing_page.dart';

class AppRouter {
  static const String landingPage = '/';
  static const String authPage = '/authPage';
  static const String homeScreen = '/homeScreen';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case landingPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LandingCubit(),
            child: const LandingPage(),
          ),
        );
      case authPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const AuthPage(),
          ),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const HomeScreen(),
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
