import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final int perguntaSelecionada;
  final List<Map<String, Object>> perguntas;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool get isQuestionSelected {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> resp = isQuestionSelected
        ? perguntas[perguntaSelecionada]['respostas'] 
        as List<Map<String, Object>>
        : [];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...resp.map((t) {
          return Resposta(
            t['texto'].toString(),
            () => responder(int.parse(t['points'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
