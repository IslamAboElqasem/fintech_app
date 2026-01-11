import 'package:fintech_app/core/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_color.dart';
import '../../../../core/theme/app_images.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const CustomBottomNavBar({
    super.key,
    this.currentIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.brightnessOf(context) == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.blackColor : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          child: Row(
            children: [
              _NavBarItem(
                icon: AppImages.homeIcon,
                activeIcon: AppImages.homeActiveColor,
                label: 'Home',
                isSelected: currentIndex == 0,
                onTap: () => onTap?.call(0),
              ),
              _NavBarItem(
                icon: AppImages.marketIcon,
                activeIcon: AppImages.marketActiveColor,
                label: 'Market',
                isSelected: currentIndex == 1,
                onTap: () => onTap?.call(1),
              ),
              _NavBarItem(
                icon: AppImages.portfolioIcon,
                activeIcon: AppImages.portfolioActiveColor,
                label: 'Portfolio',
                isSelected: currentIndex == 2,
                onTap: () => onTap?.call(2),
              ),
              _NavBarItem(
                icon: AppImages.settingIcon,
                activeIcon: AppImages.settingActiveColor,
                label: 'Settings',
                isSelected: currentIndex == 3,
                onTap: () => onTap?.call(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String icon;
  final String activeIcon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              isSelected ? activeIcon : icon,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.primary : AppColors.stormGray,
                BlendMode.srcIn,
              ),
            ),
            6.verticalSpace,
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                style: isSelected
                    ? context.bodySmall_12?.copyWith(
                        color: AppColors.primary,
                      )
                    : context.bodySmall_12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
