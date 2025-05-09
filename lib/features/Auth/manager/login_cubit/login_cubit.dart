import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/auth_repo.dart';


import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInit());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
 // String? error;

  static LoginCubit get(context) => BlocProvider.of(context);
  AuthRepo authRepo = AuthRepo();

  void onLoginPressed() {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      var result = authRepo.login(
        username: userNameController.text,
        password: passwordController.text,
      );
      result.fold(
        (String error) // left
        {
          // ignore: avoid_print
          print("Error $error");
          emit(LoginFailure(error));
        },
        (r) // right
        {
          emit(LoginSuccessState());
        },
      );
    }

    // emit(LoginLoading());
    // error = null;
    // if (!formKey.currentState!.validate()) {
    //   // if (passwordController.text != confirmPasswordController.text) {

    //   //   return;
    //   // }
    //   error = "All fields are required , please fill all the fields";
    //   if (error == null) {
    //     UserModel userModel = UserModel(userName: userNameController.text);
    //     emit(LoginSuccessState());
    //   } else {
    //     emit(LoginFailure(error!));
    //   }

    //   // Everything is valid
    // } else {
    //    UserModel userModel = UserModel(userName: userNameController.text);
    //   emit(LoginSuccessState());

    // }
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
