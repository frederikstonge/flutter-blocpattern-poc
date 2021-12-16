import 'package:blocpattern/cubits/home_cubit.dart';
import 'package:blocpattern/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = {
    Routes.home: (BuildContext buildContext) => BlocProvider(
          create: (_) => HomeCubit(),
          child: HomePage(),
        ),
  };
}
