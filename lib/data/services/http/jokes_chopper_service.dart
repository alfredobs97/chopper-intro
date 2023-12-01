import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:chopper_intro/data/dto/joke.dart';

part "jokes_chopper_service.chopper.dart";

@ChopperApi(baseUrl: "/v1/")
abstract class JokesService extends ChopperService {
  static JokesService create([ChopperClient? client]) => _$JokesService(client);

  @Get(path: '/jokes')
  Future<Response<List<Joke>>> getJokes({@Query() int? limit});

  @Post(path: '/jokes')
  Future<Response<Joke>> postJoke(@Body() Map body);

  @Put(headers: {'custom-headers': 'foo'}, path: '/other')
  Future<Response> putExamples();
}
