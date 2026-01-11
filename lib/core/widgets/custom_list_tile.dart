import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/icons/my_flutter_app_icons.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor,
    this.radius,
    required this.icon,
    this.onTap,
    this.trailing,
    this.dividerColor,
    this.isDivider = true,
  });
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? radius;
  final Widget icon;
  final void Function()? onTap;
  final Widget? trailing;
  final Color? dividerColor;
  final bool? isDivider;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.watch<ThemeCubit>().state;
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: radius ?? 24,
            backgroundColor: backgroundColor ?? AppColors.primary,
            child: icon,
          ),
          onTap: onTap,
          title: Text(
            text,
            style:
                textStyle ??
                (TextStyles.font16PrimarySemiBold.copyWith(
                  color: isDarkMode ? AppColors.snowWhite : AppColors.primary,
                )),
          ),
          trailing: trailing ?? const Icon(MyFlutterApp.arrowiconlightmode),
        ),
        verticalSpace(18),
        if (isDivider!)
          Divider(
            thickness: 2.3,
            color:
                dividerColor ??
                (isDarkMode ? AppColors.snowWhite : AppColors.primary),
          ),
        verticalSpace(18),
      ],
    );
  }
}
