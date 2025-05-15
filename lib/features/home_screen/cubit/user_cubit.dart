import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/user_model.dart';
import '../data/repo/home_repo.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  // Singleton pattern to access the cubit from anywhere in the app

  // static DataType[cubit of the class tou are in it ] get(context) => BlocProvider.of(context);
  static UserCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo = HomeRepo();

  void getUserData({required UserModel user}) {
    emit(UserGetSuccess(userModel: user));
  }

  // void getUserDataFromApi() async {
  //   var result = await homeRepo.getUserData();
  //   result.fold(
  //     (error) {
  //       emit(UserError(error: error));
  //     },
  //     (userModel) {
  //       emit(UserGetSuccess(userModel: userModel));
  //     },
  //   );
  // }
  Future<bool> getUserDataFromAPI() async {
    var response = await homeRepo.getUserData();

    return response.fold(
      (error) {
        emit(UserError(error: error));
        return false;
      },
      (userModel) {
        emit(UserGetSuccess(userModel: userModel));
        return true;
      },
    );
  }
}
