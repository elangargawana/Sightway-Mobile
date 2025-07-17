import 'package:flutter/material.dart';
import 'package:sightway_mobile/core/constants/constants.dart';

class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;

  const AppBarCustom({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.light,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: showBackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios, color: AppColors.dark),
              onPressed: () => Navigator.pop(context),
            )
          : null,
      title: Text(
        title,
        style: AppTextStyles.regular14.copyWith(color: AppColors.dark),
      ),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, thickness: 1, color: Colors.grey.shade300),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
