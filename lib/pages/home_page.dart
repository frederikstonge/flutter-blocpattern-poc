import 'package:badges/badges.dart';
import 'package:blocpattern/models/lineitem.dart';
import 'package:blocpattern/pages/search_page.dart';
import 'package:blocpattern/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocpattern/cubits/cart_cubit.dart';
import 'package:vrouter/vrouter.dart';

import 'cart_page.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  static final List<Page> pages = [
    Page(Paths.news, Routes.news, const Icon(Icons.new_label),
        const Text("news")),
    Page(Paths.search, Routes.search, const Icon(Icons.search),
        const SearchPage()),
    Page(
      Paths.cart,
      Routes.cart,
      Badge(
        child: const Icon(Icons.shopping_cart),
        position: BadgePosition.topEnd(top: -12, end: -12),
        badgeColor: Colors.blueGrey,
        badgeContent: BlocBuilder<CartCubit, List<LineItem>>(
          builder: (context, items) => Text(
            items.length.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
      const CartPage(),
    ),
  ];

  const HomePage(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index =
        pages.indexWhere((element) => element.path == context.vRouter.path);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: pages
            .map((p) => BottomNavigationBarItem(icon: p.icon, label: p.title))
            .toList(),
        currentIndex: index,
        onTap: (value) => context.vRouter.to(pages[value].path),
      ),
    );
  }
}

class Page {
  String title;
  String path;
  Widget icon;
  Widget body;

  Page(this.title, this.path, this.icon, this.body);
}
