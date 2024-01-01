import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CryptoCoinsRepository {
  Future<void> getCoinsList() async {
    final res = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BNB,AVAX&tsyms=USD',
    );
    debugPrint(res.toString());
  }
}