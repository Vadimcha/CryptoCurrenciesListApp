import 'package:dio/dio.dart';

import '../models/crypto_coin.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final res = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,AVAX,ANT,ABT,ABYSS,ACCN,ACE,ADA&tsyms=USD',
    );
    final data = res.data as Map<String, dynamic>;
    final dataRow = data['RAW'] as Map<String, dynamic>;
    // print(data.toString());
    final cryptoCoinsList = dataRow.entries.map((el) {
      final coinData =
          (el.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final price = coinData['PRICE'];
      final imageUrl = coinData['IMAGEURL'];
      return CryptoCoin(
        name: el.key,
        priceInUSD: price,
        imageUrl: 'https://www.cryptocompare.com$imageUrl',
      );
    }).toList();
    return cryptoCoinsList;
  }
}
