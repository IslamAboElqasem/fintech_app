import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/coin_details/data/model/coin_details_model.dart';

abstract class CoinDetailsRepo {
  Future<ApiReuslt<CoinDetailsModel>> getCoinDetails(String id);
}
