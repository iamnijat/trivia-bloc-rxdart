import 'package:bloc_weather/data/models/trivia_response.dart';
import 'package:bloc_weather/data/repositories/trivia_repository.dart';

import 'package:rxdart/rxdart.dart';

class GetTriviaBloc {
  final TriviaRepository _repository = TriviaRepository();
  final BehaviorSubject<TriviaResponse> _subject =
      BehaviorSubject<TriviaResponse>();

  getTriviaData() async {
    TriviaResponse response = await _repository.getTriviaData();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<TriviaResponse> get subject => _subject;
}

final getTriviaBloc = GetTriviaBloc();
