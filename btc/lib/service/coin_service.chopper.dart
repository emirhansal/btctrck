// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$CoinService extends CoinService {
  _$CoinService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CoinService;

  @override
  Future<Response<Popular>> getCoinData(String crypto, String currency) {
    final $url = 'exchangerate/${crypto}/${currency}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<Popular, Popular>($request);
  }
}
