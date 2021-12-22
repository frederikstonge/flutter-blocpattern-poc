import 'package:blocpattern/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class RootPage extends StatelessWidget {
  final Widget child;

  const RootPage(this.child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: Text(context.vRouter.path),
      ),
      body: child,
    );
  }
}
