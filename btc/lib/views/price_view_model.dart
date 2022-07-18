import 'package:btc/constants.dart';
import 'package:btc/models/popular.dart';
import 'package:btc/service/coin_service.dart';
import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceViewModel extends ChangeNotifier {
  late CoinService _service;
  late String selectedCurrency;
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  init(CoinService service) {
    _service = service;
    chopperLogger.onRecord.listen(print);
    setCurrency(Constants.currenciesList.first);
  }

  Future getCoinData() async {
    isWaiting = true;
    notifyListeners();
    Map<String, String> cryptoPrices = {};
    for (String crypto in Constants.cryptoList) {
      Response<Popular> response =
          await _service.getCoinData(crypto, selectedCurrency);
      if (response.statusCode == 200) {
        cryptoPrices[crypto] =
            response.body?.rate.toStringAsFixed(0) ?? 'unknown';
      }
    }
    isWaiting = false;
    coinValues = cryptoPrices;
    notifyListeners();
  }

  setCurrency(String? currency) {
    if (currency == null) return;
    selectedCurrency = currency;
    getCoinData();
  }
}
