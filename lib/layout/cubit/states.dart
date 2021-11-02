import 'package:mob_store_app/models/change_favorite_model.dart';

abstract class HomeStates{}

class HomeInitialState extends HomeStates{}

class HomeLoadingHomeDataState extends HomeStates {}

class HomeSuccessHomeDataState extends HomeStates {}

class HomeErrorHomeDataState extends HomeStates {
  String error;
  HomeErrorHomeDataState(this.error);
}

class HomeSuccessCategoriesState extends HomeStates {}

class HomeErrorCategoriesState extends HomeStates {}

class HomeLoadingGetFavoritesState extends HomeStates {}
class HomeSuccessGetFavoritesState extends HomeStates {}
class HomeErrorGetFavoritesState extends HomeStates {}

class HomeChangeFavoritesState extends HomeStates {}

class HomeSuccessChangeFavoritesState extends HomeStates {
  ChangeFavoritesModel? model;
  HomeSuccessChangeFavoritesState(this.model);
}
class HomeErrorChangeFavoritesState extends HomeStates {}
