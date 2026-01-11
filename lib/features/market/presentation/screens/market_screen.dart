/// ****************** FILE INFO ******************
/// File Name: market_screen.dart
/// Purpose: Market screen displaying crypto coins with pagination
/// Author: Mohamed Elrashidy
/// Created At: 09/12/2025
library;

import 'package:fintech_app/core/routing/routes.dart';
import 'package:fintech_app/core/theme/app_images.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/core/widgets/custom_loading_dialog.dart';
import 'package:fintech_app/features/market/data/models/coin_overview_extension.dart';
import 'package:fintech_app/features/market/domain/filter_entity.dart';
import 'package:fintech_app/features/market/presentation/logic/market_cubit.dart';
import 'package:fintech_app/features/market/presentation/widgets/coin_overview_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../widgets/filter_card.dart';

class MarketScreen extends StatefulWidget {
  const MarketScreen({super.key});

  @override
  State<MarketScreen> createState() => _MarketScreenState();
}

class _MarketScreenState extends State<MarketScreen> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  late MarketCubit _marketCubit;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  /// Function Name: _onScroll
  ///
  /// Purpose: Triggers loading more data when user scrolls to 90% of the list
  ///
  /// Parameters: None
  ///
  /// Returns: void
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      _marketCubit.loadMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    _marketCubit = context.read<MarketCubit>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<MarketCubit, MarketState>(
            builder: (context, state) {
              return Column(
                spacing: 16.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Crypto Market", style: TextStyles.font24PrimaryBold),
                  CustomTextFormField(
                    controller: _searchController,
                    onChanged: (value) {
                      _marketCubit.updateSearchQuery(value);
                    },
                    hintText: "Search",
                    onTap: () {},
                    prefixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/searchIcon.svg',
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AppImages.menuIcon,
                          height: 24.h,
                          width: 24.w,
                        ),
                      ],
                    ),
                    validator: (String p1) {
                      return null;
                    },
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 4.sp,
                      children: [
                        for (FilterEntity filter in _marketCubit.filters)
                          GestureDetector(
                            onTap: () {
                              _marketCubit.selectFilter(filter);
                            },
                            child: FilterCard(
                              filterEntity: filter,
                              isSelected:
                                  _marketCubit.selectedFilter.filterId ==
                                  filter.filterId,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _marketCubit.getDisplayCoins.isEmpty
                        ? Center(
                            child: Text(
                              _marketCubit.searchQuery.isEmpty
                                  ? "No coins available"
                                  : "No results found for '${_marketCubit.searchQuery}'",
                              style: TextStyles.font16MediumGrayRegular,
                            ),
                          )
                        : SingleChildScrollView(
                            controller: _scrollController,
                            child: Column(
                              spacing: 8.sp,
                              children: [
                                for (var coin in _marketCubit.getDisplayCoins)
                                  GestureDetector(
                                    onTap: () {
                                      _marketCubit.selectedCoin = coin;

                                      Navigator.pushNamed(
                                        context,
                                        Routes.coinDetailsScreen,
                                        arguments: coin.coinId,
                                      );
                                    },
                                    child: CoinOverviewCard(
                                      coin: coin.toCoinDetailsModel(),
                                    ),
                                  ),
                                if (state is MarketLoadingMoreState)
                                  Padding(
                                    padding: EdgeInsets.all(16.h),
                                    child: const CustomLoadingDialog(),
                                  ),
                              ],
                            ),
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
