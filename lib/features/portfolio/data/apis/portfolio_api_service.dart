import 'package:dio/dio.dart';
import 'package:fintech_app/core/networking/api_constant.dart';
import 'package:fintech_app/features/portfolio/data/models/coin_price_model.dart';
import 'package:retrofit/retrofit.dart';

part 'portfolio_api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class PortfolioApiService {
  factory PortfolioApiService(Dio dio, {String baseUrl}) = _PortfolioApiService;

  // GET /simple/price?ids={ids}&vs_currencies=usd&include_24hr_change=true
  @GET(ApiConstant.simplePrice)
  Future<Map<String, CoinPriceModel>> getSimplePrices(
    @Query("ids") String ids,
    @Query("vs_currencies") String vsCurrencies,
    @Query("include_24hr_change") bool include24hrChange,
  );
}
