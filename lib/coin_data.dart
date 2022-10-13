//import 'dart:convert';
import 'package:bitcoin_ticker_flutter/services/networking.dart';
import 'utilities/constants.dart';

// const List<String> currenciesList = [
//   'AUD',
//   'BRL',
//   'CAD',
//   'CNY',
//   'EUR',
//   'GBP',
//   'HKD',
//   'IDR',
//   'ILS',
//   'INR',
//   'JPY',
//   'MXN',
//   'NOK',
//   'NZD',
//   'PLN',
//   'RON',
//   'RUB',
//   'SEK',
//   'SGD',
//   'USD',
//   'ZAR'
// ];
//
// const List<String> cryptoList = [
//   'BTC',
//   'ETH',
//   'LTC',
// ];
//
// const apiKey = '077BE1B6-357E-414A-9814-4B047D6D4F86';// joao
// //const apiKey = 'F06A7D05-95BA-49B0-AA5F-99FC23C795CC'; // bind
// const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  // Métodos

  Future getCoinData(String selectedCurrency) async {
    // Map que vai conter a lista de Moedas virtuais - Chave/valor - exemplo:  {'BTC','valor'}
    Map<String, String> cryptoPrices = {};

    // Popular o Map
    for (String crypto in cryptoList) {
      NetworkHelper networkHelper = NetworkHelper('$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey');
      String rateData = await networkHelper.getData();
      cryptoPrices[crypto] = rateData;
    }
    return cryptoPrices;
  }
}
