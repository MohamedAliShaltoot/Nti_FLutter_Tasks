import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/change_language_cubit/change_language_cubit.dart';
import 'package:nti_flutter_tasks/features/setting_screen/manager/change_language_cubit/change_language_state.dart';

class DirectionalIcon extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final Color? color;
  final double? size;
  final EdgeInsetsGeometry? padding;

  const DirectionalIcon({
    Key? key,
    required this.icon,
    this.onPressed,
    this.color,
    this.size,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        final bool isArabic = context.read<LanguageCubit>().isArabic;

        return IconButton(
          padding: padding ?? EdgeInsets.zero,
          onPressed: onPressed,
          icon: icon,
          color: color,
          iconSize: size ?? 24,
          // لا نحتاج لتطبيق تحويل يدوي هنا لأن Directionality سيتعامل مع ذلك
        );
      },
    );
  }
}


class DirectionalLayout extends StatelessWidget {
  final Widget child;

  const DirectionalLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, LanguageState>(
      builder: (context, state) {
        final bool isArabic = context.read<LanguageCubit>().isArabic;

        return Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: child,
        );
      },
    );
  }
}

// مثال على كيفية الاستخدام:
// DirectionalLayout(
//   child: Scaffold(
//     appBar: AppBar(
//       leading: DirectionalIcon(
//         icon: SvgPicture.asset(AppAssets.goBackIcon),
//         onPressed: () => Navigator.pop(context),
//       ),
//     ),
//   ),
// );
