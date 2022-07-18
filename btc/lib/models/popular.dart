import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'popular.g.dart';

abstract class Popular implements Built<Popular, PopularBuilder> {
  static Serializer<Popular> get serializer => _$popularSerializer;

  double get rate;

  Popular._();

  factory Popular([void Function(PopularBuilder) updates]) = _$Popular;
}
