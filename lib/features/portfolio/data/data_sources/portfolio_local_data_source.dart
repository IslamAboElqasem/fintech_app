import 'package:fintech_app/core/constant/app_constant.dart';
import 'package:fintech_app/features/portfolio/data/models/user_holding_model.dart';
import 'package:hive_ce/hive.dart';

class PortfolioLocalDataSource {
  static const String _boxName = AppConstant.portfolioBox;

  Future<Box<UserHoldingModel>> _openBox() async {
    if (!Hive.isBoxOpen(_boxName)) {
      return await Hive.openBox<UserHoldingModel>(_boxName);
    }
    return Hive.box<UserHoldingModel>(_boxName);
  }

  Future<void> cacheHoldings(List<UserHoldingModel> holdings) async {
    final box = await _openBox();
    await box.clear();
    await box.addAll(holdings);
  }

  Future<List<UserHoldingModel>> getCachedHoldings() async {
    try {
      final box = await _openBox();
      if (box.isEmpty) {
        // Return default mock data if empty (for initial testing)
        return _getMockHoldings();
      }
      return box.values.toList();
    } catch (e) {
      return _getMockHoldings();
    }
  }

  List<UserHoldingModel> _getMockHoldings() {
    return const [
      UserHoldingModel(
        id: 'bitcoin',
        symbol: 'BTC',
        name: 'Bitcoin',
        amount: 0.05,
      ),
      UserHoldingModel(
        id: 'ethereum',
        symbol: 'ETH',
        name: 'Ethereum',
        amount: 1.5,
      ),
      UserHoldingModel(
        id: 'litecoin',
        symbol: 'LTC',
        name: 'Litecoin',
        amount: 26.3,
      ),
    ];
  }
}
