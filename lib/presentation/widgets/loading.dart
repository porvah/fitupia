import 'package:first_app/models/card_content.dart';
import 'package:first_app/models/exercises_of_bodypart_API.dart';
import 'package:first_app/presentation/screens/exercis_screen.dart';
import 'package:flutter/material.dart';


class Loading extends StatefulWidget {
  final CardContent card;
  const Loading({super.key, required this.card, });

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> setUp() async{
    ExercisesOfBodyPartAPI instanse = ExercisesOfBodyPartAPI(bodyPart: widget.card.name.toLowerCase());
    List<dynamic> data = await instanse.getData();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ExercisScreen(data: data, card: widget.card)
        )
    );
  }
  @override
  void initState() {
    super.initState();
    setUp();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "loading"
        ),
      ),
    );
  }
}