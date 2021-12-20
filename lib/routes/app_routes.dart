part of 'app_pages.dart';

abstract class Routes {
  static const home = "/${Paths.home}";
  static const news = "/${Paths.home}/${Paths.news}";
  static const search = "/${Paths.home}/${Paths.search}";
  static const cart = "/${Paths.home}/${Paths.cart}";
}

abstract class Paths {
  static const home = 'home';
  static const news = "news";
  static const search = "search";
  static const cart = "cart";
}
