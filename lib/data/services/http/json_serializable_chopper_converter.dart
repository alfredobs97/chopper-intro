import 'dart:convert';
import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:chopper_intro/data/dto/joke.dart';

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);

final Map<Type, JsonFactory> factories = {
    Joke: (json) => Joke.fromJson(json),
  };

class JsonSerializableChopperConverter extends JsonConverter {

  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(Response response) async {
    final jsonRes = await super.convertResponse(response);

    return Response<ResultType>(jsonRes.base, _decode<Item>(jsonRes.body) as ResultType);
  }

  @override
  Request encodeJson(Request request) {
    final contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body.toJson()));
    }
    return request;
  }

  dynamic _decode<T>(entity) {
    if (entity is Iterable) return _decodeList<T>(entity.toList());

    if (entity is Map) return _decodeMap<T>(entity as Map<String, dynamic>);

    return entity;
  }

  List<T?> _decodeList<T>(List values) => values.map<T>((v) => _decode<T>(v) as T).toList();

  T _decodeMap<T>(Map<String, dynamic> values) {
    if (T == dynamic) {
      return values as T;
    }
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
      throw ArgumentError('Serializer not found');
    }
    return jsonFactory(values);
  }
}
