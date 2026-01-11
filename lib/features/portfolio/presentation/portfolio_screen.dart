import 'package:fintech_app/core/di/dependency_injection.dart';
import 'package:fintech_app/features/portfolio/presentation/logic/portfolio_cubit.dart';
import 'package:fintech_app/features/portfolio/presentation/widgets/portfolio_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PortfolioCubit>()..loadPortfolio(),
      child: const Scaffold(
        body: SafeArea(
          child: PortfolioBody(),
        ),
      ),
    );
  }
}
