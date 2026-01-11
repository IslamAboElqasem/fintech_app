import 'package:fintech_app/core/networking/api_reuslt.dart';
import 'package:fintech_app/features/home/data/apis/home_api_service.dart';
import 'package:fintech_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:fintech_app/features/home/data/models/coin_model.dart';
import 'package:fintech_app/features/home/data/models/global_data_response.dart';
import 'package:fintech_app/features/home/data/models/trending_response.dart';
import 'package:fintech_app/features/home/data/repos/home_repo_impl.dart';
import 'package:fintech_app/features/home/presentation/repos/home_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeApiService extends Mock implements HomeApiService {}

class MockHomeLocalDataSource extends Mock implements HomeLocalDataSource {}

void main() {
  late HomeRepo homeRepo;
  late MockHomeApiService mockHomeApiService;
  late MockHomeLocalDataSource mockLocalDataSource;

  setUpAll(() {
    // Register fallback values for mocktail
    registerFallbackValue(GlobalDataResponse(data: GlobalMarketData.mock()));
    registerFallbackValue(const TrendingResponse(coins: []));
    registerFallbackValue(<CoinModel>[]);
  });

  setUp(() {
    mockHomeApiService = MockHomeApiService();
    mockLocalDataSource = MockHomeLocalDataSource();

    // Setup default mock behavior for cache (no cache by default)
    when(() => mockLocalDataSource.getCachedGlobalData()).thenReturn(null);
    when(() => mockLocalDataSource.isGlobalDataCacheValid()).thenReturn(false);
    when(() => mockLocalDataSource.getCachedTrendingCoins()).thenReturn(null);
    when(
      () => mockLocalDataSource.isTrendingCoinsCacheValid(),
    ).thenReturn(false);
    when(() => mockLocalDataSource.getCachedCoins()).thenReturn(null);
    when(() => mockLocalDataSource.isCoinsCacheValid()).thenReturn(false);
    when(
      () => mockLocalDataSource.cacheGlobalData(any()),
    ).thenAnswer((_) async => {});
    when(
      () => mockLocalDataSource.cacheTrendingCoins(any()),
    ).thenAnswer((_) async => {});
    when(
      () => mockLocalDataSource.cacheCoins(any()),
    ).thenAnswer((_) async => {});

    homeRepo = HomeRepoImpl(
      homeApiService: mockHomeApiService,
      localDataSource: mockLocalDataSource,
    );
  });

  group('Test Home Repo when fetch data from apis', () {
    group('getGlobalData test in success and failure', () {
      test(
        'give repo class when get global data call then return the items',
        () async {
          // Arrange: Define the mock response
          when(
            () => mockHomeApiService.getGlobalData(),
          ).thenAnswer(
            (_) async => GlobalDataResponse(data: GlobalMarketData.mock()),
          );

          // Act: Call the method under test
          final result = await homeRepo.getGlobalData();

          // Assert: Check the outcome
          expect(result, isA<Success<GlobalDataResponse>>());
          result.when(
            success: (data) {
              expect(data.data, isA<GlobalMarketData>());
              expect(data.data?.activeCryptocurrencies, 12345);
              expect(data.data?.markets, 0);
            },
            failure: (failure) {
              expect(failure, isA<Failure>());
            },
          );
        },
      );

      test(
        'give repo class when get global data call then throw execption',
        () async {
          // Arrange: Define the mock response
          when(() => mockHomeApiService.getGlobalData()).thenThrow(Exception());

          // Act: Call the method under test
          final exception = await homeRepo.getGlobalData();

          // Assert: Check the outcome
          expect(exception, isA<Failure>());
          verify(() => mockHomeApiService.getGlobalData()).called(1);
        },
      );
    });

    group('get Trending Coins test in success and failure', () {
      test(
        'give repo class when get Trending Coins call then return the items',
        () async {
          // Arrange: Define the mock response
          when(
            () => mockHomeApiService.getTrendingCoins(),
          ).thenAnswer(
            (_) async =>
                TrendingResponse(coins: [CoinWrapper(item: CoinItem.mock())]),
          );

          // Act: Call the method under test
          final result = await homeRepo.getTrendingCoins();

          // Assert: Check the outcome
          expect(result, isA<Success<TrendingResponse>>());
          result.when(
            success: (data) {
              expect(data.coins, isA<List<CoinWrapper>>());
              expect(data.coins?.first.item?.symbol, 'BTC');
              expect(data.coins?.first.item?.data?.price, 45000.0);
            },
            failure: (failure) {
              expect(failure, isA<Failure>());
            },
          );
        },
      );

      test(
        'give repo class when get Trending Coins call then throw execption',
        () async {
          // Arrange: Define the mock response
          when(
            () => mockHomeApiService.getTrendingCoins(),
          ).thenThrow(Exception());

          // Act: Call the method under test
          final exception = await homeRepo.getTrendingCoins();

          // Assert: Check the outcome
          expect(exception, isA<Failure>());
          verify(() => mockHomeApiService.getTrendingCoins()).called(1);
        },
      );
    });
  });

  group('get Coin Detail test in success and failure', () {
    test(
      'give repo class when get Coin Detail call then return the items',
      () async {
        // Arrange: Define the mock response
        when(
          () => mockHomeApiService.getCoinsDetails('usd'),
        ).thenAnswer(
          (_) async => [CoinModel.mock()],
        );

        // Act: Call the method under test
        final result = await homeRepo.getCoinsDetails();

        // Assert: Check the outcome
        expect(result, isA<Success<List<CoinModel>>>());
        result.when(
          success: (data) {
            expect(data.first.id, 'bitcoin');
            expect(data.first.symbol, 'BTC');
            expect(data.first.currentPrice, 45000.0);
          },
          failure: (failure) {
            expect(failure, isA<Failure>());
          },
        );
      },
    );

    test(
      'give repo class when get Coin Detail call then throw execption',
      () async {
        // Arrange: Define the mock response
        when(
          () => mockHomeApiService.getCoinsDetails('usd'),
        ).thenThrow(Exception());

        // Act: Call the method under test
        final exception = await homeRepo.getCoinsDetails();

        // Assert: Check the outcome
        expect(exception, isA<Failure>());
        verify(() => mockHomeApiService.getCoinsDetails('usd')).called(1);
      },
    );
  });
}
