import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/portfolio/presentation/repos/portfolio_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'portfolio_state.dart';

class PortfolioCubit extends Cubit<PortfolioState> {
  final PortfolioRepo _repo;

  PortfolioCubit(this._repo) : super(PortfolioInitial());

  Future<void> loadPortfolio() async {
    emit(PortfolioLoading());

    final result = await _repo.getPortfolioAssets();

    result.when(
      success: (assets) {
        // Calculate total value
        final totalValue = assets.fold(
          0.0,
          (sum, asset) => sum + asset.totalValueUsd,
        );
        emit(PortfolioSuccess(assets: assets, totalValue: totalValue));
      },
      failure: (error) {
        emit(PortfolioError(error.message ?? "Unknown error"));
      },
    );
  }
}
