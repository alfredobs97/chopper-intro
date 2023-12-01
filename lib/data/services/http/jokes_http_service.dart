import 'package:http/http.dart' as http;

class JokesService {
  Future getJokes({int? limit}) async {
    final Map<String, dynamic>? queryParameters = {
      if (limit != null) 'limit': limit,
    };
    final url = Uri.https('api.api-ninjas.com/v1/jokes', '', queryParameters);
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('Request not sucessful');
    }

    return response.body;
  }

  Future postJoke() async {}

  Future putExamples() async {}
}
