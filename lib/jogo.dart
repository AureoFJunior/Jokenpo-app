import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var imagemPath = AssetImage("resources/padrao.png");
  var resultado = "";

  void opcaoSelecionada(String escolhaUsu){

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch(escolhaApp){
      case "pedra" :
        setState(() {
          this.imagemPath = AssetImage("resources/pedra.png");
        });
        break;

      case "papel" :
        setState(() {
          this.imagemPath = AssetImage("resources/papel.png");
        });
        break;
      case "tesoura" :
        setState(() {
          this.imagemPath = AssetImage("resources/tesoura.png");
        });
        break;

    }

    if(
    (escolhaUsu == "pedra" && escolhaApp == "tesoura") ||
    (escolhaUsu == "tesoura" && escolhaApp == "papel") ||
    (escolhaUsu == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this.resultado = "You Win!";
      });

    }else if
    (
        (escolhaApp == "pedra" && escolhaUsu == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsu == "papel") ||
        (escolhaApp == "papel" && escolhaUsu == "pedra")
    )
    {
      setState(() {
        this.resultado = "You Lose!";
      });

    }else {

      setState(() {
        this.resultado = "Drawn!";
      });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
        centerTitle: true,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget> [
            Padding(
                padding: EdgeInsets.all(16),
              child: Text("Escolha do App", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          Image(image: this.imagemPath,),

          Padding(
            padding: EdgeInsets.all(16),
            child: Text("Escolha uma opção a baixo", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              GestureDetector(
                onTap: () => opcaoSelecionada("papel"),
                child: Image.asset("resources/papel.png", height: 100,),
              ),
              GestureDetector(
                onTap: () =>  opcaoSelecionada("pedra"),
                child: Image.asset("resources/pedra.png", height: 100),
              ),
              GestureDetector(
                onTap: () =>  opcaoSelecionada("tesoura"),
                child:  Image.asset("resources/tesoura.png", height: 100),
              ),




            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(resultado, textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))
            ],

          ),


        ],
      ),
    );
  }
}
