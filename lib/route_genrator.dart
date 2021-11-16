import 'package:esite/modules/dashboard/screens/dashboard.dart';
import 'package:esite/modules/detailview/screens/detail_view.dart';
import 'package:esite/modules/mycart/screens/mycart.dart';
import 'package:flutter/material.dart';

import 'modules/login/screens/login_screen.dart';
import 'modules/splash/ui/splash_screen.dart';

const String LOGIN = 'login';
const String SPLASH_SCREEN = 'splashscreen';
const String DASHBOARD_SCREEN = 'dashboardscreen';
const String DETAIL_VIEW_SCREEN = 'detailscreen';
const String MY_CART_SCREEN = 'mycart';

class RouteGenrator {
  static Route generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case SPLASH_SCREEN:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case LOGIN:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case DASHBOARD_SCREEN:
        return MaterialPageRoute(builder: (_) => const DashboardScreen());
      case DETAIL_VIEW_SCREEN:
        return MaterialPageRoute(
            builder: (_) => DetailView(index: args as int));
      case MY_CART_SCREEN:
        return MaterialPageRoute(builder: (_) => const MyCart());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
