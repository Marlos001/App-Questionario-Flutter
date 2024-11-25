import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  var score = 0;

  final List<Map<String, Object>> perguntas = const [
    {
      'texto': 'Qual sua cor preferida?',
      'respostas': [
        {'texto' : 'Azul', 'points' : 10},
        {'texto' : 'Vermelho', 'points' : 9},
        {'texto' : 'Amarelo', 'points' : 8},
        {'texto' : 'Verde', 'points' : 7},
      ]
    },
    {
      'texto': 'Qual seu animal preferido?',
      'respostas': [
        {'texto' : 'Cachorro', 'points' : 10},
        {'texto' : 'Gato', 'points' : 9},
        {'texto' : 'Tartaruga', 'points' : 8},
        {'texto' : 'Camelo', 'points' : 7},
      ]
    },
    {
      'texto': 'Qual seu carro preferido?',
      'respostas': [
        {'texto' : 'Camaro', 'points' : 10},
        {'texto' : '458', 'points' : 9},
        {'texto' : 'S63', 'points' : 8},
        {'texto' : 'M8', 'points' : 7},
      ]
    },
  ];

  void responder(int points) {
    setState(() {
      perguntaSelecionada++;
      score += points;
    });
  }

  void restart(){
    setState(() {
      perguntaSelecionada = 0;
      score = 0;
    });
  }

  bool get isQuestionSelected {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: Scaffold(
          appBar: AppBar(
            title: const Text('TESTEEE'),
            elevation: 10,
            centerTitle: true,
          ),
          body: isQuestionSelected
              ? Questionario(
                  perguntas: perguntas,
                  perguntaSelecionada: perguntaSelecionada,
                  responder: responder)
              : Resultado(score, restart)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
