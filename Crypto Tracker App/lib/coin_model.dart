class Coin {
  Coin({
    required this.name,
    required this.symbol,
    required this.price,
    required this.imageUrl,
    required this.priceChange,
    required this.marketCapRank,
  });

  final String name;
  final String symbol;
  final double price;
  final String imageUrl;
  final double priceChange;
  final int marketCapRank;

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['name'] ?? 'Unknown',
      symbol: json['symbol'] ?? ' ',
      price: double.parse((json['current_price'] ?? 0).toString()),
      imageUrl: json['image'] ?? 'https://via.placeholder.com/150',
      priceChange: json['price_change_percentage_24h'] ?? 0.0,
      marketCapRank: json['market_cap_rank'] ?? 0,
    );
  }
}
