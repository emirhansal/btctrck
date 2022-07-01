import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'B3E0CB5E-65A1-4252-8968-4097005091E4';

@JsonSerializable()
class Popular {
  Popular();
  Popular.fromJson(String selectedCurrency) {
    Map<String, String> cryptoPrices = {}; //keep rates
    for (String crypto in cryptoList) {
      String requestURL =
          '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = http.get(Uri.parse(requestURL)) as http.Response;
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate']; //get rate from decodedData
        cryptoPrices[crypto] = price.toStringAsFixed(0); //add to map
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
  }
}
