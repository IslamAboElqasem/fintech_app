import 'package:fintech_app/core/networking/api_error_handler.dart';
import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/coin_details/data/api/coin_details_service.dart';
import 'package:fintech_app/features/coin_details/data/model/coin_details_model.dart';
import 'package:fintech_app/features/coin_details/presentation/repo/coin_details_repo.dart';

class CoinDetailsRepoImpl implements CoinDetailsRepo {
  final CoinDetailsService coinDetailsService;

  CoinDetailsRepoImpl(this.coinDetailsService);
  @override
  Future<ApiReuslt<CoinDetailsModel>> getCoinDetails(String id) async {
    try {
      final coinDetails = await coinDetailsService.getCoinDetails(id);
      return ApiReuslt.success(coinDetails);
    } catch (error) {
      return ApiReuslt.failure(ApiErrorHandler.handle(error));
    }
  }
}
