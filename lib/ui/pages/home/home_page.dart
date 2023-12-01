import 'package:chopper/chopper.dart';
import 'package:chopper_intro/data/services/http/auth_chopper_interceptor.dart';
import 'package:chopper_intro/data/services/http/jokes_chopper_service.dart';
import 'package:chopper_intro/data/services/http/json_serializable_chopper_converter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ChopperClient _chopper = ChopperClient(
    baseUrl: Uri.https('api.api-ninjas.com'),
    services: [
      JokesService.create(),
    ],
    converter:  JsonSerializableChopperConverter(),
    errorConverter: JsonConverter(),
    interceptors: [
      HttpLoggingInterceptor(),
      AuthChopperInterceptor(),
    ],
  );
  late final JokesService _service;

  @override
  void initState() {
    super.initState();
    _service = _chopper.getService<JokesService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jokes generator'),
      ),
      body: Center(
        child: FutureBuilder(
          future: _service.getJokes(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator.adaptive();
            }
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            return Column(
              children: [
                Text('Your joke is...', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 16),
                Text(snapshot.data!.body!.first.joke),
              ],
            );
          }),
        ),
      ),
    );
  }
}
