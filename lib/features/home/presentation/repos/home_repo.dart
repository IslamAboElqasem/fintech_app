import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/home/data/models/global_data_response.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';

import '../../data/models/coin_model.dart';

abstract interface class HomeRepo {
  Future<ApiReuslt<GlobalDataResponse>> getGlobalData();
  Future<ApiReuslt<TrendingResponse>> getTrendingCoins();
  Future<ApiReuslt<List<CoinModel>>> getCoinsDetails();
}
