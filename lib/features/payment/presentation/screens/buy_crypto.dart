// ignore_for_file: avoid_print

import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:fintech_app/features/payment/presentation/cubit/payment_cubit.dart';
import 'package:fintech_app/features/payment/presentation/cubit/payment_states.dart';
import 'package:fintech_app/features/payment/presentation/widgets/buy_crypto_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyCryptoScreen extends StatefulWidget {
  const BuyCryptoScreen({super.key});

  @override
  State<BuyCryptoScreen> createState() => _BuyCryptoScreenState();
}

class _BuyCryptoScreenState extends State<BuyCryptoScreen> {
  final TextEditingController _amountController = TextEditingController(
    text: '1800.00',
  );
  String _fromCurrency = 'USD';
  String _toCurrency = 'ETH'; // العمله اللي هتشتريها
  String _fromCurrencyId = 'usd';
  String _toCurrencyId = 'ethereum';
  List<dynamic> _allCurrencies = [];
  double _currentPrice = 0.0;

  @override
  void initState() {
    super.initState();
    //to start fetching coins right after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PaymentCubit>().fetchCoins();
    });
  }

  // Swap the from and to currencies to change the direction of the trade
  void _swapCurrencies() {
    setState(() {
      final temp = _fromCurrency;
      final tempId = _fromCurrencyId;
      _fromCurrency = _toCurrency;
      _fromCurrencyId = _toCurrencyId;
      _toCurrency = temp;
      _toCurrencyId = tempId;

      if (_currentPrice > 0) {
        final currentAmount =
            double.tryParse(_amountController.text.replaceAll(',', '')) ?? 0;
        if (_isFiatCurrency(_fromCurrency)) {
          _amountController.text = (currentAmount / _currentPrice)
              .toStringAsFixed(4);
        } else {
          _amountController.text = (currentAmount * _currentPrice)
              .toStringAsFixed(2);
        }
      }
    });

    _fetchPrice();
  }

  // Check if the currency is a fiat currency
  bool _isFiatCurrency(String currency) {
    return currency == 'USD' || currency == 'EUR';
  }

  void _fetchPrice() {
    //if both currencies are the same, set price to 1.0
    if (_fromCurrencyId == _toCurrencyId) {
      setState(() => _currentPrice = 1.0);
      return;
    }
    String cryptoId, fiatId;

    if (_isFiatCurrency(_fromCurrency)) {
      cryptoId = _toCurrencyId;
      fiatId = _fromCurrencyId;
    } else if (_isFiatCurrency(_toCurrency)) {
      cryptoId = _fromCurrencyId;
      fiatId = _toCurrencyId;
    } else {
      cryptoId = _fromCurrencyId;
      fiatId = _toCurrencyId;
    }
    // to fetch the price of the selected crypto in terms of the selected fiat currency
    context.read<PaymentCubit>().fetchPrice(id: cryptoId, vs: fiatId);
  }

  // Handle currency selection from the dropdown
  void _onCurrencySelected(String currency, bool isFromCurrency) {
    String currencyId = currency.toLowerCase();
    try {
      final selectedCoin = _allCurrencies.firstWhere(
        (coin) {
          final symbol = (coin is Map ? coin['symbol'] : coin.symbol)
              ?.toString()
              .toUpperCase();
          return symbol == currency;
        },
      );

      currencyId =
          (selectedCoin is Map ? selectedCoin['id'] : selectedCoin.id) ??
          currencyId;
    } catch (e) {
      print('Currency not found: $currency');
    }

    setState(() {
      if (isFromCurrency) {
        _fromCurrency = currency;
        _fromCurrencyId = currencyId;
      } else {
        _toCurrency = currency;
        _toCurrencyId = currencyId;
      }
    });

    _fetchPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cloudWhite,
      appBar: AppBar(
        backgroundColor: AppColors.cloudWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: Text('Buy Crypto', style: TextStyles.font24PrimaryBold),
        centerTitle: true,
      ),
      body: BlocConsumer<PaymentCubit, PaymentState>(
        listener: (context, state) {
          //if list of coins is loaded, update the allCurrencies list
          if (state is CoinLoaded) {
            setState(() => _allCurrencies = state.coins);
            _fetchPrice();
          }
          if (state is CoinPriceLoaded) {
            final price = state.price.price;
            if (price != null && price > 0) {
              setState(() => _currentPrice = price);
            } else {
              print('Invalid price: $price');
            }
          }
        },
        builder: (context, state) {
          return BuyCryptoBody(
            amountController: _amountController,
            fromCurrency: _fromCurrency,
            toCurrency: _toCurrency,
            state: state,
            allCurrencies: _allCurrencies,
            currentPrice: _currentPrice,
            onSwap: _swapCurrencies,
            onAmountChanged: () => setState(() {}),
            onCurrencySelected: _onCurrencySelected,
            isFiatToCrypto:
                _isFiatCurrency(_fromCurrency) && !_isFiatCurrency(_toCurrency),
          );
        },
      ),
    );
  }
}
