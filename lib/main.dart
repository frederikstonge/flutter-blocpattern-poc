import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/cart_cubit.dart';
import 'cubits/home_cubit.dart';
import 'pages/home_page.dart';

void main() => runApp(const CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "blocpattern",
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => CartCubit(),
            lazy: false,
          ),
        ],
        child: child!,
      ),
      routes: {
        "/": (context) => BlocProvider(
              create: (_) => HomeCubit(),
              child: HomePage(),
            ),
      },
      initialRoute: "/",
    );
  }
}
