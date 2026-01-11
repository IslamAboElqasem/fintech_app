import 'package:fintech_app/core/networking/api_error_handler.dart';
import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/portfolio/data/apis/portfolio_api_service.dart';
import 'package:fintech_app/features/portfolio/data/data_sources/portfolio_local_data_source.dart';
import 'package:fintech_app/features/portfolio/data/models/portfolio_asset_model.dart';
import 'package:fintech_app/features/portfolio/presentation/repos/portfolio_repo.dart';

class PortfolioRepoImpl implements PortfolioRepo {
  final PortfolioApiService _apiService;
  final PortfolioLocalDataSource _localDataSource;

  PortfolioRepoImpl(this._apiService, this._localDataSource);

  @override
  Future<ApiReuslt<List<PortfolioAssetModel>>> getPortfolioAssets() async {
    try {
      final holdings = await _localDataSource.getCachedHoldings();

      if (holdings.isEmpty) {
        return const ApiReuslt.success([]);
      }

      final ids = holdings.map((h) => h.id).join(',');
      final pricesMap = await _apiService.getSimplePrices(ids, 'usd', true);

      final assets = holdings.map((holding) {
        final price = pricesMap[holding.id];
        return PortfolioAssetModel(
          id: holding.id,
          symbol: holding.symbol,
          name: holding.name,
          amount: holding.amount,
          currentPriceUsd: price?.price ?? 0.0,
          totalValueUsd: holding.amount * (price?.price ?? 0.0),
          change24h: price?.change24h ?? 0.0,
        );
      }).toList();

      return ApiReuslt.success(assets);
    } catch (error) {
      return ApiReuslt.failure(ApiErrorHandler.handle(error));
    }
  }
}
