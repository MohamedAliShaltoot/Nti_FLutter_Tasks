import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/user_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  static UserCubit get(context) => BlocProvider.of(context);

  void getUserData({required UserModel user}) {
    emit(UserGetSuccess(userModel: user));
  }
}
