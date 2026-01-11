import 'package:dio/dio.dart';
import 'package:fintech_app/core/networking/api_constant.dart';
import 'package:fintech_app/features/coin_details/data/model/coin_details_model.dart';
import 'package:retrofit/retrofit.dart';

part 'coin_details_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class CoinDetailsService {
  factory CoinDetailsService(Dio dio, {String baseUrl}) = _CoinDetailsService;

  @GET(ApiConstant.coinDetails)
  Future<CoinDetailsModel> getCoinDetails(@Path('id') String id);
}
