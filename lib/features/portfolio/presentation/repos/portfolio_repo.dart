import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/portfolio/data/models/portfolio_asset_model.dart';

abstract interface class PortfolioRepo {
  Future<ApiReuslt<List<PortfolioAssetModel>>> getPortfolioAssets();
}
