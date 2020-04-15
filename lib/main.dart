import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(new QuizApp());

class _QuizAppState extends State<QuizApp> {
  var _perguntaSelecionada = 0;
  
  void _responder(){
    setState(() {
      _perguntaSelecionada++;
    });
  }
 
  @override
  Widget build(BuildContext context) {
    final List<Map<String, Object>> perguntas = [
      {
        'texto':'Qual a sua cor favorita?',
        'respostas': ['Preto','Vermelho','Verde','Branco'],
      },
      {
        'texto':'Qual a seu animal favorito?',
        'respostas': ['Cachorro','Gato','Hamster','Peixe'],
      },
      {
        'texto':'Qual a seu personagem favotito?',
        'respostas': ['Mickey','Homer','Pernalonga','Popeye'],
      }
    ];
    
    List<Widget> respostas = [];
    
    for(var textoResp in perguntas[_perguntaSelecionada]['respostas']){
      respostas.add(Resposta(textoResp,_responder));     
    }

    return MaterialApp(      
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_perguntaSelecionada]['texto']),
            ...respostas,                       
          ],
        )
        ),
    );  
  }
}

class QuizApp extends StatefulWidget {

  _QuizAppState createState() {
    return _QuizAppState();
  }

}