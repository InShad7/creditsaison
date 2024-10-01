class CountryModel {
  final String commonName;
  final String officialName;
  final String currencyName;
  final String currencySymbol;
  final String flag;

  CountryModel({
    required this.commonName,
    required this.officialName,
    required this.currencyName,
    required this.currencySymbol,
    required this.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    String? currencyName;
    String? currencySymbol;
    if (json['currencies'] != null && json['currencies'] is Map) {
      var currencies = json['currencies'] as Map<String, dynamic>;
      if (currencies.isNotEmpty) {
        var firstCurrency = currencies.values.first;
        currencyName = firstCurrency['name'];
        currencySymbol = firstCurrency['symbol'];
      }
    }
    return CountryModel(
      commonName: json['name']['common'] ?? 'Unknown',
      officialName: json['name']['official'] ?? 'Unknown',
      currencyName: currencyName ?? 'Unknown',
      currencySymbol: currencySymbol ?? '',
      flag: json['flags'] != null ? json['flags']['png'] : null,
    );
  }
}
