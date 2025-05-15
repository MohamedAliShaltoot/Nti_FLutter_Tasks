import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/change_language_cubit/change_language_cubit.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/change_language_cubit/change_language_state.dart';

class AppDirectionalIcon extends StatelessWidget {
  final String assetName;
  final VoidCallback? onPressed;
  final Color? color;
  final double width;
  final double height;

  const AppDirectionalIcon({
    Key? key,
    required this.assetName,
    this.onPressed,
    this.color,
    this.width = 24,
    this.height = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        return IconButton(
          onPressed: onPressed,
          icon: SvgPicture.asset(
            assetName,
            width: width,
            height: height,
            colorFilter:
                color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
          ),
        );
      },
    );
  }
}
