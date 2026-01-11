import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theme/app_color.dart';
import '../../../data/models/trending_response.dart';
import '../../logic/cubit/home_state.dart';
import 'trending_coin_card.dart';

class TrendingSection extends StatelessWidget {
  const TrendingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.brightnessOf(context) == Brightness.dark;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending Now',
                style: context.headlineMedium_18,
              ),
              Text(
                'View all',
                style: context.labelSmall_12?.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
        16.verticalSpace,
        SizedBox(
          height: 110.h,
          child: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (previous, current) =>
                current.trendingStatus.isLoading ||
                current.trendingStatus.isSuccess ||
                current.trendingStatus.isError,
            builder: (context, state) {
              switch (state.trendingStatus) {
                case SectionStatus.initial:
                case SectionStatus.loading:
                  return Skeletonizer(
                    enabled: true,
                    ignoreContainers: false,
                    containersColor: isDark ? Colors.black : Colors.white,

                    effect: isDark
                        ? const ShimmerEffect(
                            baseColor: Color(0xFF2A2A2A),
                            highlightColor: Color(0xFF454545),
                          )
                        : const ShimmerEffect(
                            baseColor: Color(0xFFE0E0E0),
                            highlightColor: Color(0xFFF5F5F5),
                          ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return TrendingCoinCard(
                          coins: CoinWrapper.mock(),
                        );
                      },
                    ),
                  );

                case SectionStatus.success:
                  return Skeletonizer(
                    enabled: false,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      itemCount: state.trendingCoins?.coins?.length,
                      itemBuilder: (context, index) {
                        return TrendingCoinCard(
                          coins: state.trendingCoins?.coins?[index],
                        );
                      },
                    ),
                  );

                case SectionStatus.error:
                  return Center(
                    child: Text(state.trendingError ?? ''),
                  );
              }
            },
          ),
        ),
      ],
    );
  }
}
