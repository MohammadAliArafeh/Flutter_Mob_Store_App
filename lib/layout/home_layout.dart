import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_store_app/shared/app_cubit/cubit.dart';
import 'package:mob_store_app/shared/app_cubit/states.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('E-Stroe'),
            ),
            body: AppCubit.get(context).screens[AppCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: AppCubit.get(context).items,
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (index){
                AppCubit.get(context).changeBottomNavBarIndex(index);
              },
            ),
          );
        });
  }
}
