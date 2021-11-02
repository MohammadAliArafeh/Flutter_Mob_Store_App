import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_store_app/layout/cubit/states.dart';
import 'package:mob_store_app/models/category_model.dart';
import 'package:mob_store_app/models/change_favorite_model.dart';
import 'package:mob_store_app/models/favorites_model.dart';
import 'package:mob_store_app/models/home_data_model.dart';
import 'package:mob_store_app/modules/products/products_screen.dart';
import 'package:mob_store_app/shared/components/constants.dart';
import 'package:mob_store_app/shared/network/end_points.dart';
import 'package:mob_store_app/shared/network/remote/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  HomeModel? homeModel;

  Map<int, bool>? favorites = {};

  void getHomeData() {
    emit(HomeLoadingHomeDataState());

    DioHelper.getData(
      url: HOMEDATA,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel!.data!.products!.forEach((element) {
        favorites!.addAll({element.id: element.inFavorites});
      });
      print(favorites.toString());
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

  ChangeFavoritesModel? changeFavoritesModel;

  void changeFavorites(int productId) {
    favorites![productId] = !favorites![productId]!;

    emit(HomeChangeFavoritesState());

    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      print(value.data);

      if (!changeFavoritesModel!.status!) {
        favorites![productId] = !favorites![productId]!;
      } else {
        getFavorites();
      }

      emit(HomeSuccessChangeFavoritesState(changeFavoritesModel));
    }).catchError((error) {
      favorites![productId] = !favorites![productId]!;

      emit(HomeErrorChangeFavoritesState());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(HomeLoadingGetFavoritesState());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);
      //printFullText(value.data.toString());

      emit(HomeSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorGetFavoritesState());
    });
  }
}
