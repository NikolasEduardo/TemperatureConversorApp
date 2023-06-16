import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Temperatura extends StatefulWidget {
  @override
  State<Temperatura> createState() => _TemperaturaState();
}

class _TemperaturaState extends State<Temperatura> {
  TextEditingController _celsius = TextEditingController();
  var fundo = [
    Colors.amber[50],
    Colors.blue[100],
    Colors.blue[50],
    Colors.amber[100],
    Colors.red[50],
    Colors.red[100]
  ];
  var fundoNum = 0;
  var imagens = [
    'imagem/temperatura',
    'imagem/frozen',
    'imagem/frio',
    'imagem/normal',
    'imagem/calor',
    'imagem/infernal'
  ];
  var num = 0;
  var logo = 1;
  var kelvinTexto = 'Temperatura em Kelvin K°';
  var fahrenTexto = 'Temperatura em Fahrenheit F°';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo[fundoNum],
      appBar: AppBar(
        title: Text("Converter Temperatura 🔥🔥🔥"),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              GestureDetector(
                onTap: (() {
                  setState(() {
                    if (logo == 1) {
                      logo = 2;
                    } else {
                      logo = 1;
                    }
                  });
                }),
                child: Image.asset('${imagens[num]}$logo.jpg', width: 200),
              ),
              Container(height: 50),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                    labelText: "Insira a Temperatura em Celsius C°"),
                style: TextStyle(fontSize: 20, color: Colors.red[900]),
                controller: _celsius,
                onTap: () {
                  if (_celsius.text == "não insira letras!!!") {
                    _celsius.text = "";
                  }
                  setState(() {
                    fundoNum = 0;
                    num = 0;
                    kelvinTexto = 'Temperatura em Kelvin K°';
                    fahrenTexto = 'Temperatura em Fahrenheit F°';
                  });
                },
                onSubmitted: (String texto) {
                  double? temperatura = double.tryParse(texto);
                  if (temperatura != null) {
                    print('deu certo $temperatura');
                    setState(() {
                      if (temperatura <= 0) {
                        num = 1;
                        fundoNum = 1;
                      }
                      if (temperatura > 0 && temperatura <= 15) {
                        num = 2;
                        fundoNum = 2;
                      }
                      if (temperatura > 15 && temperatura <= 25) {
                        num = 3;
                        fundoNum = 3;
                      }
                      if (temperatura > 25 && temperatura <= 35) {
                        num = 4;
                        fundoNum = 4;
                      }
                      if (temperatura > 35) {
                        num = 5;
                        fundoNum = 5;
                      }

                      var kelvin = temperatura + 273.15;
                      var fahrenheit = 1.8 * temperatura + 32;

                      kelvinTexto = '$kelvin\K°';
                      fahrenTexto = '$fahrenheit\F°';
                    });
                  } else {
                    print('deu errado');
                    if (texto != "") {
                      setState(() {
                        _celsius.text = 'não insira letras!!!';
                      });
                    }
                  }
                },
              ),
              Container(height: 30),
              Text('$kelvinTexto',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.red[900])),
              Container(height: 30),
              Text(
                '$fahrenTexto',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.red[900]),
              ),
              Container(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
