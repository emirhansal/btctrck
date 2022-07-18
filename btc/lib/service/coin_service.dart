import 'package:btc/constants.dart';
import 'package:btc/models/popular.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:chopper/chopper.dart';
import 'package:chopper_built_value/chopper_built_value.dart';

part 'coin_service.chopper.dart';
part 'coin_service.g.dart';

@ChopperApi()
abstract class CoinService extends ChopperService {
  @Get(path: 'exchangerate/{crypto}/{currency}')
  Future<Response<Popular>> getCoinData(
    @Path() String crypto,
    @Path() String currency,
  );

  static CoinService create() {
    final builder = serializers.toBuilder();
    builder.addPlugin(StandardJsonPlugin());
    final jsonSerializers = builder.build();

    final client = ChopperClient(
        baseUrl: Constants.coinAPIURL,
        converter: BuiltValueConverter(jsonSerializers),
        interceptors: [
          (Request req) => req.copyWith(
                parameters: Map<String, dynamic>.from(req.parameters)
                  ..['apiKey'] = Constants.apiKey,
              ),
        ]);
    return _$CoinService(client);
  }
}

@SerializersFor([
  Popular,
])
final Serializers serializers = _$serializers;
