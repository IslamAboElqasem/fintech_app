/// ****************** FILE INFO ******************
/// File Name: market_repository.dart
/// Purpose: Repository for market data operations
/// Author: Mohamed Elrashidy
/// Created At: 09/12/2025
// ignore_for_file: unintended_html_in_doc_comment, avoid_print

library;

import 'dart:core';

import 'package:dart_either/dart_either.dart';
import 'package:fintech_app/core/networking/api_error_model.dart';
import 'package:fintech_app/features/market/data/data_sources/remote_data_source.dart';
import 'package:fintech_app/features/market/data/models/coin_overview_model.dart';

class MarketRepository {
  final MarketRemoteDataSource remoteDataSource = MarketRemoteDataSource();

  MarketRepository();

  /// Function Name: fetchMarketData
  ///
  /// Purpose: Fetches market data from remote data source and maps to CoinOverviewModel list
  ///
  /// Parameters:
  /// - pageSize: Number of items per page (default: 50)
  /// - pageNumber: Page number to fetch
  ///
  /// Returns: Either<ApiErrorModel, List<CoinOverviewModel>>
  Future<Either<ApiErrorModel, dynamic>> fetchMarketData({
    int pageSize = 50,
    required int pageNumber,
  }) async {
    Either<ApiErrorModel, dynamic> result = await remoteDataSource
        .fetchMarketData(
          pageSize: pageSize,
          pageNumber: pageNumber,
        );

    if (result.isLeft) return result;

    final rawData = result.getOrElse(() => []);
    final List<CoinOverviewModel> coins = [];

    for (var json in List<Map<String, dynamic>>.from(rawData)) {
      try {
        coins.add(CoinOverviewModel.fromJson(json));
      } catch (e) {
        // Skip invalid items and log error
        print('Error parsing coin: $e');
        print('Problematic JSON: $json');
      }
    }

    return Right(coins);
  }
}
