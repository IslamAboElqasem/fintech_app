import 'package:dio/dio.dart';
import 'package:fintech_app/core/networking/api_constant.dart';
import 'package:fintech_app/features/payment/data/models/coin_model/coin_model.dart';
import 'package:fintech_app/features/payment/data/models/coin_model/price_model.dart';
import 'package:retrofit/retrofit.dart';

part 'coin_apis.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class CoinService {
  factory CoinService(Dio dio) = _CoinService;

  @GET("coins/markets")
  Future<List<CoinModel>> getCoins(
    @Query("vs_currency") String vsCurrency,
  );

  @GET("simple/price")
  Future<SimplePriceModel> getPrice(
    @Query("ids") String fromId,
    @Query("vs_currencies") String toSymbol,
  );
}
