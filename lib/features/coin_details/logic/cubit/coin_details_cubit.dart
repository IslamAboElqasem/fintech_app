import 'package:bloc/bloc.dart';
import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/coin_details/logic/cubit/coin_details_state.dart';
import 'package:fintech_app/features/coin_details/presentation/repo/coin_details_repo.dart';

class CoinDetailsCubit extends Cubit<CoinDetailsState> {
  CoinDetailsCubit(this.coinDetailsRepoImpl)
    : super(const CoinDetailsState.loading());

  final CoinDetailsRepo coinDetailsRepoImpl;

  Future<void> getCoinDetails(String id) async {
    print("🚀 CoinDetailsCubit: getCoinDetails called with id=$id");
    emit(const CoinDetailsState.loading());
    print("⏳ CoinDetailsCubit: Loading state emitted");

    final result = await coinDetailsRepoImpl.getCoinDetails(id);
    print("📦 CoinDetailsCubit: Received result from repo");

    result.when(
      success: (data) {
        print("✅ CoinDetailsCubit: Success! Coin name: ${data.name}");
        emit(CoinDetailsState.success(data));
        print("🎉 CoinDetailsCubit: Success state emitted");
      },
      failure: (apiError) {
        print("❌ CoinDetailsCubit: Error - ${apiError.message}");
        emit(
          CoinDetailsState.error(apiError.message ?? 'Unknown error occurred'),
        );
        print("⚠️ CoinDetailsCubit: Error state emitted");
      },
    );
  }
}
