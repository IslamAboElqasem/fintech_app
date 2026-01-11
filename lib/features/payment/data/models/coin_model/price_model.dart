// ignore_for_file: avoid_print

import 'package:json_annotation/json_annotation.dart';

part 'price_model.g.dart';

@JsonSerializable()
class SimplePriceModel {
  @JsonKey(includeFromJson: false, includeToJson: false)
  final double? price;

  // نحتفظ بالـ raw data
  final Map<String, dynamic>? rawData;

  SimplePriceModel({
    this.price,
    this.rawData,
  });

  // Custom factory constructor لاستخراج السعر بشكل ديناميكي
  factory SimplePriceModel.fromJson(Map<String, dynamic> json) {
    double? extractedPrice;

    try {
      // الـ response شكله: {"ethereum": {"usd": 3016.65}}
      // نحتاج نستخرج السعر بغض النظر عن اسم العملة

      if (json.isNotEmpty) {
        // نجيب أول key (مثلاً "ethereum")
        final coinKey = json.keys.first;
        final coinData = json[coinKey];

        if (coinData is Map<String, dynamic> && coinData.isNotEmpty) {
          // نجيب أول value اللي هو السعر
          final priceValue = coinData.values.first;
          extractedPrice = (priceValue as num?)?.toDouble();
        } else if (coinData is Map && coinData.isEmpty) {
          // لو الـ response فاضي معناها نفس العملة
          extractedPrice = 1.0;
        }
      }
    } catch (e) {
      print('Error parsing price: $e');
    }

    return SimplePriceModel(
      price: extractedPrice,
      rawData: json,
    );
  }

  Map<String, dynamic> toJson() => rawData ?? {'price': price};

  @override
  String toString() => 'SimplePriceModel(price: $price, rawData: $rawData)';
}
