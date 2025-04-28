
abstract class LoginState{}

class LoginInit extends LoginState{}
class LoginLoading extends LoginState {}
class LoginSucess extends LoginState  {}

class LoginFailure extends LoginState  {
  final String errorMsg;

  LoginFailure(this.errorMsg);
}

class ShowPassword extends LoginState {}

class HidePassword extends LoginState {}
