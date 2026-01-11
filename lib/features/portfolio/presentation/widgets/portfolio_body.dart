import 'package:fintech_app/core/helpers/extension.dart';
import 'package:fintech_app/core/theme/font_weight_helper.dart';
import 'package:fintech_app/features/portfolio/presentation/logic/portfolio_cubit.dart';
import 'package:fintech_app/features/portfolio/presentation/logic/portfolio_state.dart';
import 'package:fintech_app/features/portfolio/presentation/widgets/balance/potfolio_balance_card.dart';
import 'package:fintech_app/features/portfolio/presentation/widgets/portfolio_chart_section.dart';
import 'package:fintech_app/features/portfolio/presentation/widgets/portfolio_list.dart';
import 'package:fintech_app/features/portfolio/presentation/widgets/recent_transactions_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PortfolioBody extends StatelessWidget {
  const PortfolioBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.read<PortfolioCubit>().loadPortfolio(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Portfolio',
                    style: context.displaySmall_20?.copyWith(
                      fontSize: 24.sp,
                      fontWeight: FontWeightHelper.bold,
                    ),
                  ),
                  16.verticalSpace,
                  const PotfolioBalanceCard(),
                  20.verticalSpace,
                  const PortfolioChartSection(),
                  const SizedBox(height: 30),
                  Text(
                    'My Holdings',
                    style: context.headlineMedium_18,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          BlocBuilder<PortfolioCubit, PortfolioState>(
            builder: (context, state) {
              return switch (state) {
                PortfolioInitial() => const SliverFillRemaining(
                  child: SizedBox(),
                ),
                PortfolioLoading() => const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
                PortfolioSuccess(assets: final assets) => PortfolioList(
                  assets: assets,
                ),
                PortfolioError(message: final msg) => SliverFillRemaining(
                  child: Center(child: Text('Error: $msg')),
                ),
              };
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.h),
              child: const RecentTransactionsSection(),
            ),
          ),
        ],
      ),
    );
  }
}
