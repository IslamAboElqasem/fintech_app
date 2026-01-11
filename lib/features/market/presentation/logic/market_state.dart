part of 'market_cubit.dart';

@immutable
sealed class MarketState {}

final class MarketInitial extends MarketState {}

final class MarketFilterSelectedState extends MarketState {}

final class MarketLoadingState extends MarketState {}

final class MarketSuccessState extends MarketState {}

final class MarketErrorState extends MarketState {
  MarketErrorState();
}

final class MarketLoadingMoreState extends MarketState {}

final class MarketLoadMoreErrorState extends MarketState {}

final class MarketSearchQueryUpdatedState extends MarketState {}
