import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:nti_flutter_tasks/core/translation/translation_helper.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/change_language_cubit/change_language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial()) {
   
    _checkCurrentLanguage();
  }

static LanguageCubit get(context) => BlocProvider.of(context);
 
  void _checkCurrentLanguage() {
    final isArabic = Get.locale?.languageCode == 'ar';
    if (isArabic) {
      emit(ArabicLanguageState());
    } else {
      emit(EnglishLanguageState());
    }
  }

  // تغيير اللغة
  void changeLanguage(bool toArabic) {
    TranslationHelper.changeLanguage(toArabic);
    if (toArabic) {
      emit(ArabicLanguageState());
    } else {
      emit(EnglishLanguageState());
    }
  }

  
  bool get isArabic => state is ArabicLanguageState;
}
