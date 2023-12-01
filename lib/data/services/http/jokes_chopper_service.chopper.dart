// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jokes_chopper_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: type=lint
final class _$JokesService extends JokesService {
  _$JokesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = JokesService;

  @override
  Future<Response<List<Joke>>> getJokes({int? limit}) {
    final Uri $url = Uri.parse('/v1/jokes');
    final Map<String, dynamic> $params = <String, dynamic>{'limit': limit};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<Joke>, Joke>($request);
  }

  @override
  Future<Response<Joke>> postJoke(Map<dynamic, dynamic> body) {
    final Uri $url = Uri.parse('/v1/jokes');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Joke, Joke>($request);
  }

  @override
  Future<Response<dynamic>> putExamples() {
    final Uri $url = Uri.parse('/v1/other');
    final Map<String, String> $headers = {
      'custom-headers': 'foo',
    };
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
