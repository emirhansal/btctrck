import 'package:btc/constants.dart';
import 'package:btc/service/coin_service.dart';
import 'package:btc/views/price_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class PriceView extends StatelessWidget {
  const PriceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      ViewModelBuilder<PriceViewModel>.reactive(
          viewModelBuilder: () => PriceViewModel(),
          onModelReady: (model) => model.init(context.read<CoinService>()),
          builder: (context, model, child) => Scaffold(
                appBar: AppBar(title: const Text('🤑 Coin Ticker')),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        for (String crypto in Constants.cryptoList)
                          CryptoCard(
                            cryptoCurrency: crypto,
                            selectedCurrency: model.selectedCurrency,
                            value: model.isWaiting
                                ? '?'
                                : model.coinValues[crypto],
                          )
                      ],
                    ),
                    Container(
                      height: 150.0,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: 30.0),
                      color: Colors.lightBlue,
                      child: dropdown(
                        model.selectedCurrency,
                        model.setCurrency,
                      ),
                    ),
                  ],
                ),
              ));
}

DropdownButton<String> dropdown(
  String currency,
  Function(String?) onChanged,
) =>
    DropdownButton<String>(
      value: currency,
      items: Constants.currenciesList
          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
          .toList(),
      onChanged: onChanged,
    );

class CryptoCard extends StatelessWidget {
  const CryptoCard({
    required this.value,
    required this.selectedCurrency,
    required this.cryptoCurrency,
  });

  final String? value;
  final String? selectedCurrency;
  final String? cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
