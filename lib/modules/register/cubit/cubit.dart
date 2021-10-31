import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_store_app/modules/register/cubit/states.dart';
import 'package:mob_store_app/shared/network/end_points.dart';
import 'package:mob_store_app/shared/network/remote/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);


  void  userRegister({
  required String email,
    required String password,
    required String name,
    required String phone
}){
    emit(RegisterLoadingState());

    DioHelper.postData(url: REGISTER, data: {
      'email':email,
      'password':password,
      'name':name,
      'phone':phone
    }).then((value) {
      emit(RegisterSuccessState());
    }).catchError((error){
      emit(RegisterErrorState());
    });
  }
}