import 'package:fintech_app/features/coin_details/data/model/coin_details_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_details_state.freezed.dart';

@freezed
class CoinDetailsState with _$CoinDetailsState {
  const factory CoinDetailsState.loading() = Loading;
  const factory CoinDetailsState.success(CoinDetailsModel coinDetails) =
      _Success;
  const factory CoinDetailsState.error(String error) = _Error;
}
