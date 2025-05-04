import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home_screen/data/user_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInit());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  String? error;

  static LoginCubit get(context) => BlocProvider.of(context);

  void onLoginPressed() {
    emit(LoginLoading());
    error = null;
    if (!formKey.currentState!.validate()) {
      // if (passwordController.text != confirmPasswordController.text) {

      //   return;
      // }
      error = "All fields are required , please fill all the fields";
      if (error == null) {
        UserModel userModel = UserModel(userName: emailController.text);
        emit(LoginSuccessState(userModel));
      } else {
        emit(LoginFailure(error!));
      }

      // Everything is valid
    } else {
       UserModel userModel = UserModel(userName: emailController.text);
      emit(LoginSuccessState(userModel));
     
    }
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    if (isPasswordVisible) {
      emit(ShowPassword());
    } else {
      emit(HidePassword());
    }
  }

}
