import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:mob_store_app/modules/login/login_screen.dart';
import 'package:mob_store_app/modules/on_boarding/on_boarding_screen.dart';
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
  runApp(MyApp(onBoarding??false));
}

class MyApp extends StatelessWidget {
  final bool onBoarding;

  const MyApp(this.onBoarding, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      // ignore: prefer_const_constructors
      home: onBoarding ? LoginScreen():OnBoardingScreen(),
    );
  }
}
