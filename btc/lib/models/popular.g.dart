// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Popular> _$popularSerializer = new _$PopularSerializer();

class _$PopularSerializer implements StructuredSerializer<Popular> {
  @override
  final Iterable<Type> types = const [Popular, _$Popular];
  @override
  final String wireName = 'Popular';

  @override
  Iterable<Object?> serialize(Serializers serializers, Popular object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'rate',
      serializers.serialize(object.rate, specifiedType: const FullType(double)),
    ];

    return result;
  }

  @override
  Popular deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PopularBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(double))! as double;
          break;
      }
    }

    return result.build();
  }
}

class _$Popular extends Popular {
  @override
  final double rate;

  factory _$Popular([void Function(PopularBuilder)? updates]) =>
      (new PopularBuilder()..update(updates))._build();

  _$Popular._({required this.rate}) : super._() {
    BuiltValueNullFieldError.checkNotNull(rate, r'Popular', 'rate');
  }

  @override
  Popular rebuild(void Function(PopularBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PopularBuilder toBuilder() => new PopularBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Popular && rate == other.rate;
  }

  @override
  int get hashCode {
    return $jf($jc(0, rate.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Popular')..add('rate', rate))
        .toString();
  }
}

class PopularBuilder implements Builder<Popular, PopularBuilder> {
  _$Popular? _$v;

  double? _rate;
  double? get rate => _$this._rate;
  set rate(double? rate) => _$this._rate = rate;

  PopularBuilder();

  PopularBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _rate = $v.rate;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Popular other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Popular;
  }

  @override
  void update(void Function(PopularBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Popular build() => _build();

  _$Popular _build() {
    final _$result = _$v ??
        new _$Popular._(
            rate: BuiltValueNullFieldError.checkNotNull(
                rate, r'Popular', 'rate'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
