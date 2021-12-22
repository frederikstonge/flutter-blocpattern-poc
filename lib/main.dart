import 'package:blocpattern/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vrouter/vrouter.dart';

import 'cubits/cart_cubit.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VRouter(
      title: "blocpattern",
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CartCubit(),
            lazy: false,
          ),
        ],
        child: child,
      ),
      routes: AppPages.routes,
    );
  }
}
