import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/theme_cubit/theme_cubit.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/theme_cubit/theme_state.dart';


class ThemeToggleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state.isDarkMode;

        return IconButton(
          icon: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return RotationTransition(turns: animation, child: child);
            },
            child: Icon(
              isDarkMode ? Icons.light_mode : Icons.dark_mode,
              key: ValueKey<bool>(isDarkMode),
              color: AppColors.primary,
              size: 30,
            ),
          ),
          onPressed: () {
            // Toggle theme with animation
            context.read<ThemeCubit>().toggleTheme();
          },
        );
      },
    );
  }
}
