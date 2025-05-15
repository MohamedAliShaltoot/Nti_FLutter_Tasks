import 'package:flutter/material.dart';
import 'package:nti_flutter_tasks/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.scaffoldBackground,
      title: Text(title, style: const TextStyle(color: Colors.black)),
      centerTitle: true,
      actions: actions,
      leading: leading,
    );
  }
}
