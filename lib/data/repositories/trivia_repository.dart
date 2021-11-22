import 'dart:async';
import 'package:bloc_weather/data/models/trivia_response.dart';
import 'package:dio/dio.dart';

class TriviaRepository {
  final Dio _dio = Dio();
  static String mainUrl = "https://opentdb.com/api.php";
  static String numOfPages = "10";
  static String difficulty = "medium";

  Future<TriviaResponse> getTriviaData() async {
    var params = {"amount": numOfPages, "difficulty": difficulty};
    try {
      Response response = await _dio.get(mainUrl, queryParameters: params);
      return TriviaResponse.fromJson(response.data);
    } catch (error) {
      return TriviaResponse.withError("$error");
    }
  }
}
