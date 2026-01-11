import 'package:dio/dio.dart';
import 'package:fintech_app/features/home/data/apis/home_api_constants.dart';
import 'package:fintech_app/features/home/data/models/coin_model.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/networking/api_constant.dart';
import '../models/global_data_response.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;

  @GET(HomeApiConstants.globalEndPoint)
  Future<GlobalDataResponse> getGlobalData();

  @GET(HomeApiConstants.searchTrendingEndPoint)
  Future<TrendingResponse> getTrendingCoins();

  @GET(HomeApiConstants.coinMarketsEndPoint)
  Future<List<CoinModel>> getCoinsDetails(
    @Query('vs_currency') String vsCurrency,
  );
}
