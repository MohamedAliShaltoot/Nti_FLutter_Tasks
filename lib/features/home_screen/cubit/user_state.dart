
import '../data/models/user_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserGetSuccess extends UserState {
  UserModel userModel;
  UserGetSuccess({required this.userModel});
}
