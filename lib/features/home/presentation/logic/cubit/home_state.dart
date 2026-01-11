import 'package:fintech_app/features/home/data/models/coin_model.dart';
import 'package:fintech_app/features/home/data/models/global_data_response.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';

enum SectionStatus { initial, loading, success, error }

class HomeState<T> {
  // Global Data Section
  final SectionStatus globalStatus;
  final GlobalMarketData? globalData;
  final String? globalError;

  // Trending Section
  final SectionStatus trendingStatus;
  final TrendingResponse? trendingCoins;
  final String? trendingError;

  // Coins  Section
  final SectionStatus coinsStatus;
  final List<CoinModel>? coinsList;
  final String? coinsError;

  const HomeState({
    this.globalStatus = SectionStatus.initial,
    this.globalData,
    this.globalError,
    this.trendingStatus = SectionStatus.initial,
    this.trendingCoins,
    this.trendingError,
    this.coinsStatus = SectionStatus.initial,
    this.coinsList,
    this.coinsError,
  });

  HomeState copyWith({
    SectionStatus? globalStatus,
    GlobalMarketData? globalData,
    String? globalError,
    SectionStatus? trendingStatus,
    TrendingResponse? trendingCoins,
    String? trendingError,
    SectionStatus? coinsStatus,
    List<CoinModel>? coinsList,
    String? coinsError,
  }) {
    return HomeState(
      globalStatus: globalStatus ?? this.globalStatus,
      globalData: globalData ?? this.globalData,
      globalError: globalError ?? this.globalError,
      trendingStatus: trendingStatus ?? this.trendingStatus,
      trendingCoins: trendingCoins ?? this.trendingCoins,
      trendingError: trendingError ?? this.trendingError,
      coinsStatus: coinsStatus ?? this.coinsStatus,
      coinsList: coinsList ?? this.coinsList,
      coinsError: coinsError ?? this.coinsError,
    );
  }
}

extension HomeStateExtension on SectionStatus {
  bool get isInitial => this == SectionStatus.initial;
  bool get isLoading => this == SectionStatus.loading;
  bool get isSuccess => this == SectionStatus.success;
  bool get isError => this == SectionStatus.error;
}
