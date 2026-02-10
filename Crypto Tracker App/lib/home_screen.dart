import 'dart:convert';

import 'package:crypto_tracker/coin_model.dart';
import 'package:crypto_tracker/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.isDark,
  });
  final VoidCallback onThemeChanged;
  final bool isDark;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Coin> coins = [];

  @override
  void initState() {
    super.initState();
    fetchCoins();
  }

  Future<void> fetchCoins() async {
    final url = Uri.parse(
      'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false',
    );

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);

        setState(() {
          coins = data.map((c) => Coin.fromJson(c)).toList();
        });
      } else {
        print('Some error occured ${response.statusCode}');
      }
    } catch (e) {
      print('Some error occured during data fetching $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Crypto Tracker'),
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: widget.onThemeChanged,
          ),
        ],
      ),
      body: coins.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: fetchCoins,
              child: ListView.builder(
                itemCount: coins.length,
                itemBuilder: (context, index) {
                  final coin = coins[index];
                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => DetailsScreen(coin: coin),
                        ),
                      );
                    },
                    leading: Image.network(coin.imageUrl, width: 30),
                    title: Text(
                      coin.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(coin.symbol.toUpperCase()),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${coin.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '${coin.priceChange.toStringAsFixed(2)}%',
                          style: TextStyle(
                            color: coin.priceChange >= 0
                                ? Colors.green
                                : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
    );
  }
}
