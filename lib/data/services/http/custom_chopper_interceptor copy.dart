import 'dart:async';

import 'package:chopper/chopper.dart';

class CustomChopperInterceptor implements RequestInterceptor, ResponseInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    print('SENDING REQUEST TO ${request.uri.host} WITH THIS BODY ${request.body}');
    return request;
  }

  @override
  FutureOr<Response> onResponse(Response response) async {
    print('RESPONSE WITH HTTP CODE ${response.base.statusCode} AND BODY ${response.body}');
    return response;
  }
}
