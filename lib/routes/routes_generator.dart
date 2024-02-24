import 'package:flutter/material.dart';
import 'package:products_challenge/features/auth/register/presenter/pages/register_page.dart';
import 'package:products_challenge/features/home/presenter/controllers/home_controller.dart';
import 'package:products_challenge/features/home/presenter/pages/add_product_page.dart';
import 'package:products_challenge/features/home/presenter/pages/home_page.dart';

class RoutesConstants {
  static const home = "/";
  static const addProduct = "/add_product";
  static const registerUser = "/register_user";
}

class RoutesGenerator {
  static Map<String, dynamic> getRoutes(RouteSettings setting) => {
        RoutesConstants.home: (context) => const HomePage(),
        RoutesConstants.addProduct: (context) => AddProductPage(
              controller: setting.arguments as HomeController,
            ),
        RoutesConstants.registerUser: (context) => const RegisterUserPage()
      };

  static Route<dynamic>? generateRoutes(RouteSettings settings) {
    final routes = RoutesGenerator.getRoutes(settings);
    final WidgetBuilder? builder = routes[settings.name];

    if (builder == null) return;
    
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          builder(context),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
