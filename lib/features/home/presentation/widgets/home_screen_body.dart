import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/features/home/presentation/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'balance/balance_card.dart';
import 'header/home_header.dart';
import 'market_overview/market_overview_section.dart';
import 'top_gainers/top_gainers_section.dart';
import 'trending/trending_section.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.blackColor,
      onRefresh: () async => context.read<HomeCubit>().fetchAllData(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const HomeHeader(),
            8.verticalSpace,
            const BalanceCard(),
            24.verticalSpace,
            const MarketOverviewSection(),
            24.verticalSpace,
            const TrendingSection(),
            24.verticalSpace,
            const TopGainersSection(),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }
}
