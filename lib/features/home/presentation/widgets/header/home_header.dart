import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/features/profile/logic/cubit/user_cubit.dart';
import 'package:fintech_app/features/profile/logic/cubit/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_color.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: AppColors.stoneGray,
            child: Icon(
              Icons.person,
              size: 24.sp,
              color: AppColors.snowWhite,
            ),
          ),
          12.horizontalSpace,
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                loaded: (user) => Text(
                  'Hi, ${user.firstName} 👋',
                  style: context.headlineMedium_18,
                ),

                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SvgPicture.asset(
              'assets/svg/notificationIcon.svg',
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
      ),
    );
  }
}
