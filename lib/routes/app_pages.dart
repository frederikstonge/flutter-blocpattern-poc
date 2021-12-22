import 'package:blocpattern/pages/home_page.dart';
import 'package:blocpattern/pages/root_page.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    VNester(
      path: "/",
      widgetBuilder: (child) => RootPage(child),
      nestedRoutes: [
        VRouteRedirector(path: '', redirectTo: Routes.home),
        VNester(
          path: Routes.home,
          widgetBuilder: (child) {
            return HomePage(child);
          },
          nestedRoutes: [
            VRouteRedirector(path: '', redirectTo: HomePage.pages.first.path),
            ...HomePage.pages.map((p) => VWidget(path: p.path, widget: p.body)),
          ],
        ),
      ],
    ),
    VWidget(path: "*", widget: const Text("Not Found"))
  ];
}
