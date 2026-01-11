import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/home/presentation/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(const HomeState());

  void fetchAllData() {
    fetchGlobalData();
    fetchTrendingCoins();
    fetchTopGainers();
  }

  Future<void> fetchGlobalData() async {
    emit(state.copyWith(globalStatus: SectionStatus.loading));
    final data = await homeRepo.getGlobalData();
    data.when(
      success: (globalData) => emit(
        state.copyWith(
          globalStatus: SectionStatus.success,
          globalData: globalData.data,
        ),
      ),
      failure: (errorMessage) => emit(
        state.copyWith(
          globalStatus: SectionStatus.error,
          globalError: errorMessage.message,
        ),
      ),
    );
  }

  Future<void> fetchTrendingCoins() async {
    emit(state.copyWith(trendingStatus: SectionStatus.loading));
    final data = await homeRepo.getTrendingCoins();
    data.when(
      success: (coins) => emit(
        state.copyWith(
          trendingStatus: SectionStatus.success,
          trendingCoins: coins,
        ),
      ),
      failure: (errorMessage) => emit(
        state.copyWith(
          trendingStatus: SectionStatus.error,
          trendingError: errorMessage.message,
        ),
      ),
    );
  }

  Future<void> fetchTopGainers() async {
    emit(state.copyWith(coinsStatus: SectionStatus.loading));
    final data = await homeRepo.getCoinsDetails();
    data.when(
      success: (coins) => emit(
        state.copyWith(
          coinsStatus: SectionStatus.success,
          coinsList: coins,
        ),
      ),
      failure: (errorMessage) => emit(
        state.copyWith(
          coinsStatus: SectionStatus.error,
          coinsError: errorMessage.message,
        ),
      ),
    );
  }
}
