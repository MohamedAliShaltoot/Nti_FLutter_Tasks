import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_flutter_tasks/core/network/api_helper.dart';
import 'package:nti_flutter_tasks/features/home_screen/cubit/user_cubit.dart';
import 'package:nti_flutter_tasks/features/profile_screen/manager/update_profile_cubit/update_profile_state.dart';
import 'package:nti_flutter_tasks/features/profile_screen/repo/update_user_repo.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());

 ApiHelper apiHelper = ApiHelper();
 UpdateUserProfileRepo updateProfileRepo = UpdateUserProfileRepo();
  static UpdateProfileCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
XFile? image;
 

  void updateProfileBtn() async {
   // emit(UpdateProfileLoadingState());
   if (formKey.currentState!.validate()) {
      emit(UpdateProfileLoadingState());
      var result = await updateProfileRepo.updateUserProfile(
        userName: userNameController.text,
         image: image,
        
      );
      result.fold(
        (String error) // left
        {
          emit(UpdateProfileErrorState(
              error: error));
        },
        (r) // right
        {
          emit(UpdateProfileSuccessState(
             
          ));
          // call get user data from API
          // UserCubit.get(context).getUserDataFromAPI();
        },
      );
    }
    
    
  }
}
 