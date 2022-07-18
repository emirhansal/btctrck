import 'package:btc/service/coin_service.dart';
import 'package:btc/views/price_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Provider(
        create: (_) => CoinService.create(),
        child: MaterialApp(
          title: 'Coin Tracker',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const PriceView(),
        ),
      );
}
