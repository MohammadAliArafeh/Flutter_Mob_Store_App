import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_store_app/modules/catergories/categories_screen.dart';
import 'package:mob_store_app/modules/favorites/favorites_screen.dart';
import 'package:mob_store_app/modules/products/products_screen.dart';
import 'package:mob_store_app/modules/settings/settings_screen.dart';
import 'package:mob_store_app/shared/app_cubit/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex= 0;
  List<Widget> screens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen(),
  ];
  List<BottomNavigationBarItem> items=[
    BottomNavigationBarItem(icon: Icon(Icons.shopping_basket_outlined),label: 'Products'),
    BottomNavigationBarItem(icon: Icon(Icons.category_outlined),label: 'Category'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favorite'),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
  ];

  void changeBottomNavBarIndex(index){
    currentIndex= index;
    emit(AppChangeBottomNavBarIndexState());
  }
}