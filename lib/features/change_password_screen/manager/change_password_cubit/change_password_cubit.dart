import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_flutter_tasks/features/change_password_screen/data/repo/change_password_repo.dart';
import 'package:nti_flutter_tasks/features/change_password_screen/manager/change_password_cubit/change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit()
      : super(ChangePasswordInitialState());

       GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(ChangePasswordInitialState());
  }
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ChangePasswordInitialState());
  }








  void changePassword() async {
    if (formKey.currentState!.validate()) {
      emit(ChangePasswordLoadingState());
      // Call the repository method to change the password
      final result = await ChangePasswordRepo().changePassword(
        currentPassword: currentPasswordController.text,
        newPassword: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
      result.fold(
        (error) {
          emit(ChangePasswordErrorState(error));
        },
        (message) {
          emit(ChangePasswordSuccessState(message));
        },
      );
    }
  }
}