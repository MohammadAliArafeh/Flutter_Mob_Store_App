import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_store_app/layout/cubit/cubit.dart';
import 'package:mob_store_app/layout/cubit/states.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){},
      builder:(context,state){
        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [

          ],
        ),
      );
      },
    );
  }
}
