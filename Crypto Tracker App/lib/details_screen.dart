import 'package:flutter/material.dart';
import 'package:crypto_tracker/coin_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.coin});
  final Coin coin;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          coin.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: isDark ? Colors.white10 : Colors.grey[100],
                shape: BoxShape.circle,
              ),
              child: Image.network(coin.imageUrl, width: 80, height: 80),
            ),
            const SizedBox(height: 15),
            Chip(
              label: Text(coin.symbol.toUpperCase()),
              backgroundColor: Colors.orange.withValues().withAlpha(2),
            ),
            const SizedBox(height: 10),
            Text(
              '\$${coin.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 30),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    _buildStatTile(
                      Icons.leaderboard_outlined,
                      'Market Rank',
                      '#${coin.marketCapRank}',
                      Colors.amber,
                    ),
                    const Divider(indent: 20, endIndent: 20),
                    _buildStatTile(
                      Icons.trending_up,
                      '24h High',
                      '\$${(coin.price + 150).toStringAsFixed(2)}',
                      Colors.green,
                    ),
                    const Divider(indent: 20, endIndent: 20),
                    _buildStatTile(
                      Icons.pie_chart_outline,
                      'Price Change',
                      '${coin.priceChange.toStringAsFixed(2)}%',
                      coin.priceChange >= 0 ? Colors.green : Colors.red,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildStatTile(
    IconData icon,
    String title,
    String value,
    Color color,
  ) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey, fontSize: 14),
      ),
      trailing: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
