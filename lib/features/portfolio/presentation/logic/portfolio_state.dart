import 'package:fintech_app/features/portfolio/data/models/portfolio_asset_model.dart';

sealed class PortfolioState {}

final class PortfolioInitial extends PortfolioState {}

final class PortfolioLoading extends PortfolioState {}

final class PortfolioSuccess extends PortfolioState {
  final List<PortfolioAssetModel> assets;
  final double totalValue;

  PortfolioSuccess({
    required this.assets,
    required this.totalValue,
  });
}

final class PortfolioError extends PortfolioState {
  final String message;

  PortfolioError(this.message);
}
