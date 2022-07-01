import 'package:chopper/chopper.dart';
import '../models/popular.dart';

part 'coin_service.chopper.dart';

@ChopperApi(baseUrl: 'https://rest.coinapi.io/v1/exchangerate')
abstract class CoinService extends ChopperService {
  @Get()
  Future<Response<Popular>> getCoinData();

  static CoinService create() {
    const url = 'https://rest.coinapi.io/v1/exchangerate';
    final client = ChopperClient(
      baseUrl: url,
      converter: JsonConverter(),
      services: [
        _$CoinService(),
      ],
    );
    return _$CoinService(client);
  }
}
