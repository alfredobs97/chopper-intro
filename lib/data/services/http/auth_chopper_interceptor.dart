import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:chopper_intro/data/services/store/store_service.dart';

class AuthChopperInterceptor implements RequestInterceptor, ResponseInterceptor {
  final _storeService = StoreService();
  @override
  FutureOr<Request> onRequest(Request request) async {
    final String authToken = await _storeService.getAuthToken();
    return request.copyWith(headers: {'X-Api-Key': authToken});
  }

  @override
  FutureOr<Response> onResponse(Response response) async {
    return response;
  }
}
