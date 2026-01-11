import 'package:fintech_app/core/helpers/spacing.dart';
import 'package:fintech_app/core/icons/my_flutter_app_icons.dart';
import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/core/theme/theme_cubit.dart';
import 'package:fintech_app/core/widgets/custom_list_tile.dart';
import 'package:fintech_app/features/profile/logic/cubit/user_cubit.dart';
import 'package:fintech_app/features/profile/presentation/widgets/logout_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.watch<ThemeCubit>().state;
    return LogoutBlocListenr(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: TextStyles.font16PrimarySemiBold.copyWith(
              color: isDarkTheme ? AppColors.snowWhite : AppColors.primary,
            ),
          ),
          verticalSpace(20),
          const CustomListTile(
            text: 'Language',
            icon: Icon(
              MyFlutterApp.languageicon,
              color: AppColors.snowWhite,
            ),
          ),
          CustomListTile(
            text: 'Dark Mode',
            icon: const Icon(
              MyFlutterApp.darkmodeicon,
              color: AppColors.snowWhite,
            ),

            ///? there is an issue her when the user toggle between the dark and light there is a drop happaned in the frame I searched for more than 2 hours and I don't know where is the problem and how can I sort it
            trailing: Switch(
              value: isDarkTheme,
              onChanged: (_) {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
          ),
          CustomListTile(
            trailing: const SizedBox(),
            isDivider: false,
            text: 'Logout',
            textStyle: TextStyles.font16PrimaryBold.copyWith(
              color: AppColors.redColor,
            ),
            icon: IconButton(
              onPressed: () => context.read<UserCubit>().logout(),
              icon: const Icon(
                Icons.logout,
                color: AppColors.redColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
