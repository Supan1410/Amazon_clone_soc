import "package:amazon/features/auth/screens/auth_screen.dart";
import "package:amazon/features/home/screens/home_screen.dart";
import "package:flutter/material.dart";

Route<dynamic> generateRoute(RouteSettings routesettings) {
  switch (routesettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routesettings,
        builder: (_) => const AuthScreen()
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routesettings,
        builder: (_) => const HomeScreen()
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Screen does not exists!')),
        ),
      );
  }
}