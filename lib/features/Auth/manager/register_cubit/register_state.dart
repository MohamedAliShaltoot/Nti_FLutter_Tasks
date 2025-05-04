import '../../../home_screen/data/user_model.dart';

abstract class RegisterState {}

class RegisterInit extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  UserModel userModel;
  RegisterSuccessState(this.userModel);
}

class RegisterFailure extends RegisterState {
  final String errorMsg;

  RegisterFailure(this.errorMsg);
}

class ShowPassword extends RegisterState {}

class HidePassword extends RegisterState {}
