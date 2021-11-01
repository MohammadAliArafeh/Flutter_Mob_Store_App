import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_store_app/layout/home_layout.dart';
import 'package:mob_store_app/modules/login/login_screen.dart';
import 'package:mob_store_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:mob_store_app/shared/app_cubit/cubit.dart';
import 'package:mob_store_app/shared/bloc_observer.dart';
import 'package:mob_store_app/shared/network/local/cache_helper.dart';
import 'package:mob_store_app/shared/network/remote/dio_helper.dart';
import 'package:mob_store_app/shared/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();
  bool? onBoarding = await CacheHelper.getData(key: 'onBoarding');
  String? token = await CacheHelper.getData(key: 'token');
  print(token);
  print(onBoarding);
  Widget widget;
  if (token!.isNotEmpty) {
    widget = HomeLayout();
  } else if (onBoarding ?? false) {
    widget = LoginScreen();
  } else {
    widget = const OnBoardingScreen();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget widget;

  const MyApp(this.widget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      // ignore: prefer_const_constructors
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppCubit(),
          ),
        ],
        child: widget,
      ),
    );
  }
}
