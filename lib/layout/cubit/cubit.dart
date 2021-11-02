import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_store_app/layout/cubit/states.dart';
import 'package:mob_store_app/models/category_model.dart';
import 'package:mob_store_app/models/home_data_model.dart';
import 'package:mob_store_app/modules/products/products_screen.dart';
import 'package:mob_store_app/shared/components/constants.dart';
import 'package:mob_store_app/shared/network/end_points.dart';
import 'package:mob_store_app/shared/network/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;

  void getHomeData() {
    emit(HomeLoadingHomeDataState());

    DioHelper.getData(
      url: HOMEDATA,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      emit(HomeSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorHomeDataState(error.toString()));
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES, token: token,
    ).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      emit(HomeSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorCategoriesState());
    });
  }
}
