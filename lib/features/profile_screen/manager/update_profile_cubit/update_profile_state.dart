abstract class UpdateProfileState {
  
}

class UpdateProfileInitial extends UpdateProfileState {}
class UpdateProfileLoadingState extends UpdateProfileState {}
class UpdateProfileSuccessState extends UpdateProfileState {
  //  String message;
  // UpdateProfileSuccessState({required this.message});
}
class UpdateProfileErrorState extends UpdateProfileState {
   String error;
  UpdateProfileErrorState({required this.error});
}