import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/repo/auth_repo.dart';
import 'register_state.dart';

import '../../../home_screen/data/user_model.dart';


class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInit());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  int selectedGender = 0;
  bool isChecked = false;
  String? error;
XFile? image;
  AuthRepo authRepo = AuthRepo();
  static RegisterCubit get(context) => BlocProvider.of(context);

  void onRegisterPressed() {
    // emit(RegisterLoading());
    // error = null;
    // if (formKey.currentState!.validate()) {
    //   if (passwordController.text != confirmPasswordController.text) {

    //     return;
    //   }
    //   error = "All fields are required , please fill all the fields";
    //   if (error == null) {
    //     UserModel userModel = UserModel(userName: emailController.text);
    //     emit(RegisterSuccessState(userModel));
    //   } else {
    //     emit(RegisterFailure(error!));
    //   }

    //   // Everything is valid
    // } else {
    //   UserModel userModel = UserModel(userName: emailController.text);
    //   emit(RegisterSuccessState(userModel));
    // }
     if(formKey.currentState!.validate())
    {
      emit(RegisterLoading());
      var result =  authRepo.register(username: emailController.text, password: passwordController.text);
      result.fold(
        (String error) // left
        {
          emit(RegisterFailure(error));
        },
        (r) // right
        {
          emit(RegisterSuccessState());
        });
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
