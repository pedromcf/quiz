import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;  
  final _perguntas = const [
      {
        'texto':'Qual a sua cor favorita?',
        'respostas': [
          {'texto': 'Preto' , 'pontuacao': 10},
          {'texto': 'Vermelho', 'pontuacao': 5},
          {'texto': 'Verde', 'pontuacao': 3},
          {'texto': 'Branco', 'pontuacao': 1},
        ],
      },
      {
        'texto':'Qual a seu animal favorito?',
        'respostas': [
          {'texto':'Cachorro', 'pontuacao': 5},
          {'texto':'Gato', 'pontuacao': 10},
          {'texto':'Hamster', 'pontuacao': 1},
          {'texto':'Peixe', 'pontuacao': 3},
        ],
      },
      {
        'texto':'Qual a seu personagem favotito?',
        'respostas': [
          {'texto':'Mickey', 'pontuacao': 1},
          {'texto':'Homer', 'pontuacao': 5},
          {'texto':'Pernalonga', 'pontuacao': 10},
          {'texto':'Popeye', 'pontuacao': 3},
        ],
      }
    ];
  
  void _responder(int pontuacao){
    if(temPerguntaSelecionada){
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }        
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }  

 
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(      
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: temPerguntaSelecionada 
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              quandoResponder: _responder) 
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario)
      ),
    );  
  }
}

class QuizApp extends StatefulWidget {

  _QuizAppState createState() {
    return _QuizAppState();
  }

}