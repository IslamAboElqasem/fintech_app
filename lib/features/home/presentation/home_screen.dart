import 'package:dio/dio.dart';
import 'package:fintech_app/core/di/dependency_injection.dart';
import 'package:fintech_app/features/coin_details/data/api/coin_details_service.dart';
import 'package:fintech_app/features/coin_details/data/repo/coin_details_repo_impl.dart';
import 'package:fintech_app/features/coin_details/logic/cubit/coin_details_cubit.dart';
import 'package:fintech_app/features/market/presentation/logic/market_cubit.dart';
import 'package:fintech_app/features/market/presentation/screens/market_screen.dart';
import 'package:fintech_app/features/portfolio/presentation/portfolio_screen.dart';
import 'package:fintech_app/features/profile/logic/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../profile/presentation/screens/profile_screen.dart';
import 'widgets/custom_bottom_nav_bar.dart';
import 'widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomeScreenBody(),
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MarketCubit(),
          ),
          BlocProvider(
            create: (context) => CoinDetailsCubit(
              CoinDetailsRepoImpl(CoinDetailsService(Dio())),
            ),
          ),
        ],
        child: const MarketScreen(),
      ),
      const PortfolioScreen(),
      const SettingsScreen(),
    ];
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider.value(
          value: getIt<UserCubit>()..getCurrentUser(),
          child: IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}
