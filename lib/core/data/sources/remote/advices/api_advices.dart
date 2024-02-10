import 'package:arosa_je/core/api_client.dart';
import 'package:arosa_je/core/data/entities/advice/advices.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_advices.g.dart';

@riverpod
ApiAdvices apiAdvices(ApiAdvicesRef ref) {
  final client = Client();

  return ApiAdvices(
    innerClient: client,
  );
}

class ApiAdvices extends ApiClient {
  ApiAdvices({
    required super.innerClient,
  });

  Future<Advices?> getAllAdvices() async {
    return this.get(
      '/api/Advices',
      deserializer: (json) => Advices.fromJson(json as Map<String, dynamic>),
    );
  }
}
