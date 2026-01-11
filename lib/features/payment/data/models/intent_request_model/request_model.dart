

class IntentRequestModel {

  final String amount;
  final String currency;

  IntentRequestModel({required this.amount, required this.currency});

  factory IntentRequestModel.fromJson(Map<String, dynamic> json) {
    return IntentRequestModel(
      amount: json['amount'],
      currency: json['currency'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }
}     