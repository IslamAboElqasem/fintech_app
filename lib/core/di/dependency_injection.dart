import 'package:dio/dio.dart';
import 'package:fintech_app/core/helpers/shared_pref.dart';
import 'package:fintech_app/core/service/stripe_service.dart';
import 'package:fintech_app/core/services/local_auth_services.dart';
import 'package:fintech_app/core/theme/theme_cubit.dart';
import 'package:fintech_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:fintech_app/features/auth/logic/cubit/auth_cubit.dart';
import 'package:fintech_app/features/auth/presentation/repo/auth_repo.dart';
import 'package:fintech_app/features/coin_details/data/api/coin_details_service.dart';
import 'package:fintech_app/features/coin_details/data/repo/coin_details_repo_impl.dart';
import 'package:fintech_app/features/coin_details/logic/cubit/coin_details_cubit.dart';
import 'package:fintech_app/features/coin_details/presentation/repo/coin_details_repo.dart';
import 'package:fintech_app/features/home/data/apis/home_api_service.dart';
import 'package:fintech_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:fintech_app/features/home/data/data_sources/home_local_data_source_impl.dart';
import 'package:fintech_app/features/home/data/repos/home_repo_impl.dart';
import 'package:fintech_app/features/home/presentation/repos/home_repo.dart';
import 'package:fintech_app/features/payment/data/apis/coin_apis.dart';
import 'package:fintech_app/features/payment/data/repos/payment_repo.dart';
import 'package:fintech_app/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:fintech_app/features/portfolio/data/apis/portfolio_api_service.dart';
import 'package:fintech_app/features/portfolio/data/data_sources/portfolio_local_data_source.dart';
import 'package:fintech_app/features/portfolio/data/repos/portfolio_repo_impl.dart';
import 'package:fintech_app/features/portfolio/presentation/logic/portfolio_cubit.dart';
import 'package:fintech_app/features/portfolio/presentation/repos/portfolio_repo.dart';
import 'package:fintech_app/features/profile/data/repo/user_repo_impl.dart';
import 'package:fintech_app/features/profile/logic/cubit/user_cubit.dart';
import 'package:fintech_app/features/profile/presentation/repo/user_repo.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/presentation/logic/cubit/home_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> initGetIt() async {
  // Dio & Api Service
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  final SharedPref sharedPref = await SharedPref.getInstance();

  /// Auth
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl());
  getIt.registerLazySingleton<LocalAuthService>(() => LocalAuthService());
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt(), getIt()));
  // Theme
  getIt.registerSingleton<SharedPref>(sharedPref);
  getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit(getIt()));
  getIt.registerLazySingleton<CoinDetailsService>(
    () => CoinDetailsService(getIt()),
  );
  getIt.registerLazySingleton<CoinDetailsRepo>(
    () => CoinDetailsRepoImpl(getIt()),
  );

  getIt.registerFactory<CoinDetailsCubit>(
    () => CoinDetailsCubit(getIt()),
  );

  // Profile
  getIt.registerLazySingleton<UserRepo>(() => UserRepoImpl());
  getIt.registerFactory<UserCubit>(() => UserCubit(getIt()));

  /// Home_Api_Service =>  Home_Repo => Home_Cubit
  /// Home Feature Dependencies
  /// HomeLocalDataSource => HomeApiService => HomeRepo => HomeCubit
  getIt.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );

  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));

  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      homeApiService: getIt(),
      localDataSource: getIt(),
    ),
  );

  // Portfolio
  getIt.registerLazySingleton<PortfolioApiService>(
    () => PortfolioApiService(dio),
  );
  getIt.registerLazySingleton<PortfolioLocalDataSource>(
    () => PortfolioLocalDataSource(),
  );
  getIt.registerLazySingleton<PortfolioRepo>(
    () => PortfolioRepoImpl(getIt(), getIt()),
  );

  // Cubits
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerFactory<PortfolioCubit>(() => PortfolioCubit(getIt()));
  //  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));

  // Payment Feature Dependencies
  _initPaymentDependencies();
}

void _initPaymentDependencies() {
  getIt.registerLazySingleton<CoinService>(() => CoinService(getIt<Dio>()));
  getIt.registerLazySingleton<StripeService>(() => StripeService());
  getIt.registerLazySingleton<PaymentRepo>(
    () => PaymentRepo(
      stripeService: getIt<StripeService>(),
      api: getIt<CoinService>(),
    ),
  );

  getIt.registerLazySingleton<PaymentCubit>(
    () => PaymentCubit(paymentRepo: getIt<PaymentRepo>()),
  );
}
