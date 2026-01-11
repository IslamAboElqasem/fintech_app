import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/icons/my_flutter_app_icons.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/core/theme/theme_cubit.dart';
import 'package:fintech_app/core/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class GeneralSection extends StatelessWidget {
  const GeneralSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.watch<ThemeCubit>().state;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'General',
          style: TextStyles.font16PrimarySemiBold.copyWith(
            color: isDarkMode ? AppColors.snowWhite : AppColors.primary,
          ),
        ),
        verticalSpace(20),
        const CustomListTile(
          text: 'My Account',
          icon: Icon(
            MyFlutterApp.profileicon,
            color: AppColors.snowWhite,
          ),
        ),
        CustomListTile(
          text: 'Billing/Payment',
          icon: SvgPicture.asset(
            AppImages.walletIcon,
            width: 24,
            height: 24,
            colorFilter: const ColorFilter.mode(
              AppColors.snowWhite,
              BlendMode.srcIn,
            ),
          ),
        ),
        const CustomListTile(
          text: 'FAQ & Support',
          icon: Icon(
            MyFlutterApp.supporticon,
            color: AppColors.snowWhite,
          ),
        ),
      ],
    );
  }
}
