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