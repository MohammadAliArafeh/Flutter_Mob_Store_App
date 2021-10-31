import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_store_app/models/login_model.dart';

import 'package:mob_store_app/modules/login/cubit/states.dart';
import 'package:mob_store_app/shared/network/end_points.dart';
import 'package:mob_store_app/shared/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  late LoginModel loginModel;

  userLogin({
    required String email,
    required String password,
}) async {
    emit(LoginLoadingState());

   await DioHelper.postData(url: LOGIN, data: {
      'email':email,
      'password':password
    }).then((value) {
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      //print(loginModel.data.token);
      emit(LoginSuccessState(loginModel));
    }).catchError((error){
      emit(LoginErrorState());
      print(error.toString() + ' s s s s s s s ss s s s s s');
    });
  }
}