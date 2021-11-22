import 'package:bloc_weather/data/models/trivia.dart';
import 'package:bloc_weather/data/models/trivia_response.dart';
import 'package:bloc_weather/logic/bloc/get_trivia_bloc.dart';
import 'package:bloc_weather/presentation/pages/home/widgets/home_exception.dart';
import 'package:flutter/material.dart';

import 'widgets/home_loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getTriviaBloc.getTriviaData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<TriviaResponse>(
            stream: getTriviaBloc.subject.stream,
            builder: (context, AsyncSnapshot<TriviaResponse> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.error != null &&
                    snapshot.data.error.isNotEmpty) {
                  return buildErrorWidget(snapshot.data.error);
                }
                return _buildSliderWidget(snapshot.data);
              } else if (snapshot.hasError) {
                return buildErrorWidget(snapshot.error);
              } else {
                return buildLoadingWidget();
              }
            },
          )
        ],
      ),
    );
  }
}

Widget _buildSliderWidget(TriviaResponse data) {
  List<TriviaModel> trivia = data.trivia;

  return SizedBox(
    height: 400,
    child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: trivia.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16, right: 6),
        itemBuilder: (context, index) {
          return Container(
              margin: const EdgeInsets.only(right: 30, left: 30),
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromRGBO(240, 165, 0, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Text(
                      trivia[index].question,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          letterSpacing: 0.8,
                          height: 1.2,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: Text(
                      trivia[index].correctAnswer,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins"),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ));
        }),
  );
}
