import 'trivia.dart';

class TriviaResponse {
  final List<TriviaModel> trivia;
  final String error;

  TriviaResponse(this.trivia, this.error);

  TriviaResponse.fromJson(Map<String, dynamic> json)
      : trivia = (json["results"] as List)
            .map((i) => TriviaModel.fromJson(i))
            .toList(),
        error = "";

  TriviaResponse.withError(String errorValue)
      : trivia = [],
        error = errorValue;
}
