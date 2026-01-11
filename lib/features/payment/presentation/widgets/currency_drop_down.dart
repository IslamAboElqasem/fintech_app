import 'package:fintech_app/core/theme/app_color.dart';
import 'package:fintech_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCurrencyDropdown extends StatelessWidget {
  final String selectedCurrency;
  final List<dynamic> currencies;
  final Function(String) onSelected;
  final IconData icon;
  final bool isCrypto;

  const CustomCurrencyDropdown({
    super.key,
    required this.selectedCurrency,
    required this.currencies,
    required this.onSelected,
    required this.icon,
    this.isCrypto = false,
  });

  List<Map<String, dynamic>> _getAllCurrencies() {
    final fiatCurrencies = [
      {
        'id': 'usd',
        'name': 'US Dollar',
        'symbol': 'USD',
        'icon': Icons.attach_money,
        'image': null,
      },
      {
        'id': 'eur',
        'name': 'Euro',
        'symbol': 'EUR',
        'icon': Icons.euro,
        'image': null,
      },
    ];

    // استخدم Set عشان نشيل الـ duplicates
    final Map<String, Map<String, dynamic>> uniqueCryptos = {};

    for (var coin in currencies) {
      String symbol;
      String id;
      String name;
      String? image;

      if (coin is Map<String, dynamic>) {
        symbol = (coin['symbol'] ?? '').toString().toUpperCase();
        id = coin['id'] ?? '';
        name = coin['name'] ?? '';
        image = coin['image'];
      } else {
        symbol = (coin.symbol ?? '').toString().toUpperCase();
        id = coin.id ?? '';
        name = coin.name ?? '';
        image = coin.image;
      }

      if (symbol.isNotEmpty && !uniqueCryptos.containsKey(symbol)) {
        uniqueCryptos[symbol] = {
          'id': id,
          'name': name,
          'symbol': symbol,
          'image': image,
          'icon': Icons.currency_bitcoin,
        };
      }
    }

    return [...fiatCurrencies, ...uniqueCryptos.values];
  }

  @override
  Widget build(BuildContext context) {
    final allCurrencies = _getAllCurrencies();
    final isValidSelection = allCurrencies.any(
      (c) => c['symbol'] == selectedCurrency,
    );
    final validSelectedCurrency = isValidSelection
        ? selectedCurrency
        : (allCurrencies.isNotEmpty ? allCurrencies[0]['symbol'] : 'USD');

    return Row(
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: validSelectedCurrency,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.smokeGray,
              size: 20.sp,
            ),
            dropdownColor: AppColors.snowWhite,
            elevation: 8,
            style: TextStyles.font16PrimaryBold,
            items: allCurrencies.map((currency) {
              final symbol = currency['symbol']?.toString() ?? '';
              final image = currency['image'];

              return DropdownMenuItem<String>(
                value: symbol,
                child: Row(
                  children: [
                    if (isCrypto &&
                        image != null &&
                        image.toString().isNotEmpty)
                      CircleAvatar(
                        radius: 20.r,
                        backgroundColor: AppColors.silverWhite,
                        child: Image.network(
                          image.toString(),
                          width: 20.w,
                          height: 20.h,
                          errorBuilder: (_, __, ___) => Icon(icon, size: 16.sp),
                        ),
                      )
                    else if (isCrypto)
                      Container(
                        width: 20.w,
                        height: 20.h,
                        decoration: const BoxDecoration(
                          color: AppColors.silverWhite,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(icon, color: Colors.white, size: 12.sp),
                      )
                    else
                      Icon(currency['icon'] ?? icon, size: 16.sp),
                    SizedBox(width: 5.w),
                    Text(symbol),
                  ],
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue != null) {
                onSelected(newValue);
              }
            },
          ),
        ),
      ],
    );
  }
}
