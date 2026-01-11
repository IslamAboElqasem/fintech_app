// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:fintech_app/features/market/data/models/coin_overview_model.dart';
import 'package:fintech_app/features/market/data/repositories/market_repository.dart';
import 'package:fintech_app/features/market/domain/filter_entity.dart';
import 'package:flutter/material.dart';

part 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  final MarketRepository marketRepository = MarketRepository();

  MarketCubit() : super(MarketInitial()) {
    fetchMarketData();
  }

  CoinOverviewModel? selectedCoin;
  FilterEntity selectedFilter = FilterEntity(
    filterId: "All",
    filterName: "All",
  );
  List<FilterEntity> filters = [
    FilterEntity(filterId: "All", filterName: "All"),
    FilterEntity(filterId: "Gainers", filterName: "Gainers"),
    FilterEntity(filterId: "Losers", filterName: "Losers"),
    FilterEntity(filterId: "Favorites", filterName: "Favorites"),
  ];

  List<CoinOverviewModel> coins = [];
  String searchQuery = '';
  int currentPage = 0;
  bool isLoadingMore = false;
  bool hasMoreData = true;
  final int pageSize = 50;

  void selectFilter(FilterEntity filter) {}

  /// Function Name: getDisplayCoins
  ///
  /// Purpose: Returns filtered coins based on search query
  ///
  /// Parameters: None
  ///
  /// Returns: List< CoinOverv iewModel>
  List<CoinOverviewModel> get getDisplayCoins {
    if (searchQuery.isEmpty) {
      return coins;
    }
    return coins.where((coin) {
      return coin.coinName.toLowerCase().contains(searchQuery.toLowerCase()) ||
          coin.symbol.toLowerCase().contains(searchQuery.toLowerCase()) ||
          coin.coinId.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();
  }

  /// Function Name: updateSearchQuery
  ///
  /// Purpose: Updates search query and filters coins
  ///
  /// Parameters:
  /// - query: Search query string
  ///
  /// Returns: void
  void updateSearchQuery(String query) {
    searchQuery = query;
    emit(MarketSearchQueryUpdatedState());
  }

  /// Function Name: loadMoreData
  ///
  /// Purpose: Loads next page of market data when user scrolls to bottom
  ///
  /// Parameters: None
  ///
  /// Returns: void
  Future<void> loadMoreData() async {
    // Prevent multiple simultaneous requests
    if (isLoadingMore || !hasMoreData) return;

    isLoadingMore = true;
    emit(MarketLoadingMoreState());

    currentPage++;

    final result = await marketRepository.fetchMarketData(
      pageNumber: currentPage,
      pageSize: pageSize,
    );

    if (result.isLeft) {
      currentPage--; // Revert page increment on error
      isLoadingMore = false;
      emit(MarketLoadMoreErrorState());
    } else {
      final newCoins = result.getOrElse(() => []);

      if (newCoins.isEmpty || newCoins.length < pageSize) {
        hasMoreData = false;
      }

      coins.addAll(newCoins);
      print('Total coins: ${coins.length}');

      isLoadingMore = false;
      emit(MarketSuccessState());
    }
  }

  void fetchMarketData() {
    emit(MarketLoadingState());
    currentPage = 1;
    hasMoreData = true;
    marketRepository
        .fetchMarketData(
          pageNumber: currentPage,
          pageSize: pageSize,
        )
        .then((result) {
          if (result.isLeft) {
            emit(MarketErrorState());
          } else {
            coins = result.getOrElse(() => []);
            emit(MarketSuccessState());
          }
        });
  }
}
