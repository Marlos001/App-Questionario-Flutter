import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int points;
  final void Function() onRestart;

  const Resultado(this.points, this.onRestart, {super.key});

  String get congratulations {
    if (points < 22) {
      return '21';
    } else if (points < 25) {
      return '24';
    } else if (points < 28) {
      return '27';
    } else {
      return '30';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            congratulations,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 36),
          ),
        ),
        ElevatedButton(
          onPressed: onRestart,
          child: const Text(
            'Restart?',
            style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
          ),
        )
      ],
    );
  }
}
