/// ****************** FILE INFO ******************
/// File Name: remote_data_source.dart
/// Purpose: Remote data source for fetching market data from API
/// Author: Mohamed Elrashidy
/// Created At: 09/12/2025
// ignore_for_file: unintended_html_in_doc_comment

library;

import 'package:dart_either/dart_either.dart';
import 'package:fintech_app/core/networking/api_constant.dart';
import 'package:fintech_app/core/networking/api_error_model.dart';
import 'package:fintech_app/core/networking/dio_repository.dart';

class MarketRemoteDataSource {
  /// Function Name: fetchMarketData
  ///
  /// Purpose: Fetches market data from CoinGecko API
  ///
  /// Parameters:
  /// - pageSize: Number of items per page (default: 50)
  /// - pageNumber: Page number to fetch
  ///
  /// Returns: Either<ApiErrorModel, dynamic>
  Future<Either<ApiErrorModel, dynamic>> fetchMarketData({
    int pageSize = 50,
    required int pageNumber,
  }) async {
    Map<String, dynamic> queryParameters = {
      'vs_currency': 'usd',
      "order": "market_cap_desc",
      "per_page": pageSize,
      "page": pageNumber,
    };
    return await DioRepository.getRequest(
      ApiConstant.marektConisEndpoint,
      queryParameters: queryParameters,
    );
  }
}
