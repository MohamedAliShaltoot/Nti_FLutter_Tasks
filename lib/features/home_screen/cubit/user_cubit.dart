import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/user_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  // Singleton pattern to access the cubit from anywhere in the app

  // static DataType[cubit of the class tou are in it ] get(context) => BlocProvider.of(context);
  static UserCubit get(context) => BlocProvider.of(context);

  void getUserData({required UserModel user}) {
    emit(UserGetSuccess(userModel: user));
  }
}
