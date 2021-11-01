import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
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

  void userLogin({
    required String email,
    required String password,
}) async {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
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

  IconData passIcon = Icons.remove_red_eye_outlined;
  bool passState = true;

  void changePasswordState(){
    passState = !passState;
    passIcon = passState? Icons.visibility_off_outlined:Icons.remove_red_eye_outlined;
    emit(LoginChangePasswordStateState());
  }
}