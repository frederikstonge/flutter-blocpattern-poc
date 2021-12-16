import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocpattern/cubits/cart_cubit.dart';
import 'package:blocpattern/cubits/home_cubit.dart';
import 'package:blocpattern/pages/search_page.dart';

import 'cart_page.dart';

class HomePage extends StatelessWidget {
  final List<Page> pages = [
    Page("news", const Text("news"), const Icon(Icons.new_label)),
    Page("search", const SearchPage(), const Icon(Icons.search)),
    Page(
      "cart",
      const CartPage(),
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

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, int>(
      builder: (context, index) => Scaffold(
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
                  Navigator.of(context).popAndPushNamed("/");
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(pages.elementAt(index).title),
        ),
        body: pages.elementAt(index).body,
        bottomNavigationBar: BottomNavigationBar(
          items: pages
              .map((p) => BottomNavigationBarItem(icon: p.icon, label: p.title))
              .toList(),
          currentIndex: index,
          onTap: (value) => context.read<HomeCubit>().selectedIndex(value),
        ),
      ),
    );
  }
}

class Page {
  String title;
  Widget body;
  Widget icon;

  Page(this.title, this.body, this.icon);
}
