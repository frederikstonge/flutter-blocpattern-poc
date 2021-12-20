import 'package:badges/badges.dart';
import 'package:blocpattern/models/lineitem.dart';
import 'package:blocpattern/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocpattern/cubits/cart_cubit.dart';
import 'package:vrouter/vrouter.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  final List<Page> pages = [
    Page(Paths.news, Routes.news, const Icon(Icons.new_label)),
    Page(Paths.search, Routes.search, const Icon(Icons.search)),
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
    ),
  ];

  HomePage(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var index =
        pages.indexWhere((element) => element.path == context.vRouter.path);

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.red,
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                context.vRouter.to(Routes.home);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("app"),
      ),
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

  Page(this.title, this.path, this.icon);
}
