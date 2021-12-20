import 'package:blocpattern/pages/cart_page.dart';
import 'package:blocpattern/pages/home_page.dart';
import 'package:blocpattern/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    VNester(
      path: Routes.home,
      widgetBuilder: (child) => HomePage(child),
      nestedRoutes: [
        VRouteRedirector(path: '', redirectTo: Routes.news),
        VWidget(path: Paths.news, widget: const Text("news")),
        VWidget(path: Paths.search, widget: const SearchPage()),
        VWidget(path: Paths.cart, widget: const CartPage())
      ],
    ),
  ];
}
