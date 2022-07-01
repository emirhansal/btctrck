import 'package:btc/service/coin_service.dart';
import 'package:btc/views/price_view.dart';
import 'package:btc/views/price_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) {
        CoinService.create();
      },
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: ChangeNotifierProvider(
            create: (context) => PriceViewModel(),
            child: const PriceView(),
          )),
    );
    ;
  }
}
