import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/change_language_cubit/change_language_cubit.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/change_language_cubit/change_language_state.dart';

class AppLanguageProvider extends StatelessWidget {
  final Widget child;

  const AppLanguageProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          final bool isArabic = context.read<LanguageCubit>().isArabic;

          return Directionality(
            textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
            child: child,
          );
        },
      ),
    );
  }
}
