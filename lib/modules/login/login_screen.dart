// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mob_store_app/modules/login/cubit/cubit.dart';
import 'package:mob_store_app/modules/login/cubit/states.dart';
import 'package:mob_store_app/modules/register/register_screen.dart';
import 'package:mob_store_app/shared/components/components.dart';
import 'package:mob_store_app/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status) {
              showToast(state.loginModel.massage, ToastState.SUCCESS);
            } else {
              showToast(state.loginModel.massage, ToastState.ERROR);
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        onTap: () {},
                        onChange: (val) {},
                        onSubmit: (val) {},
                        validate: (String value) {
                          if (value.isEmpty || value == '') {
                            return 'E-Mail Should not be empty.';
                          }
                          return null;
                        },
                        label: 'E-Mail',
                        prefix: Icons.email,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      defaultFormField(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        onTap: () {},
                        onChange: (val) {},
                        onSubmit: (val) {},
                        isPassword: true,
                        validate: (String value) {
                          if (value.isEmpty || value == '') {
                            return 'Password Should not be empty.';
                          }
                          return null;
                        },
                        label: 'Password',
                        prefix: Icons.password,
                        suffixPressed: () {},
                        suffix: Icons.remove_red_eye_outlined,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      state is LoginLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              text: 'login',
                              isUpperCase: true,
                            ),
                      // ignore: prefer_const_constructors
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('You don\'t have an account ?'),
                          TextButton(
                              onPressed: () {
                                navigateTo(context, RegisterScreen());
                              },
                              child: const Text('Register Now')),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
