import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(this.pontuacao, this.quandoReiniciarQuestionario);

  String get fraseResultado {
    if(pontuacao < 8){
      return 'Parabéns! Sua pontuação foi: ${pontuacao}';
    }
    else if(pontuacao < 12) {
      return 'Você é bom! Sua pontuação foi: ${pontuacao}';
    }
    else if(pontuacao < 16) {
      return 'Impressionante! Sua pontuação foi: ${pontuacao}';
    }
    else{
      return 'Sensacional! Sua pontuação foi: ${pontuacao}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,      
      children: <Widget>[
        Center(      
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
            textAlign: TextAlign.center,
          ),
        ),
        FlatButton(
          child: Text(
            'Reiniciar?',
            style: TextStyle(fontSize: 28)
          ),
          textColor: Colors.blue,
          onPressed: quandoReiniciarQuestionario,
        )
      ],
    );
  }
}