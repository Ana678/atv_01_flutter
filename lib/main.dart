import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black87,
    ));
    runApp(
        MaterialApp(title: "Contador de pessoas", home: Home())); //Material App
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoa = 0;
  String _mensagem = "Seja bem vindo(a), pode entrar!";
  Color _bg_color_mensagem = Colors.green;

  void _changePeople(int delta) {
    setState(() {
      _pessoa += delta;
      if (_pessoa >= 20) {
        _mensagem = "No momento está lotado, aguarde um momento.";
        _bg_color_mensagem = Colors.red;
        _pessoa = 20;
      } else if (_pessoa < 20 && _pessoa >= 0) {
        _mensagem = "Seja bem vindo(a), pode entrar!";
        _bg_color_mensagem = Colors.green;
      } else {
        _pessoa = 0;
      }
    });
  }

  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
            "Imagens/restaurante.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
        ),
        Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black38,
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(32, 120, 32, 40),
            child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Column(
                    children: <Widget>[
                        Text(
                            "Há $_pessoa pessoas",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 54,
                                decoration: TextDecoration.none,
                            ),
                        ),

                        Padding(
                            padding: EdgeInsets.fromLTRB(4, 8, 4, 0),
                            child: Text(
                                _mensagem,
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 28,
                                    decoration: TextDecoration.none,
                                    backgroundColor: _bg_color_mensagem.withOpacity(0.5),
                                ),
                                textAlign: TextAlign.center,
                            ),
                        ),
                    ],
                ),
                Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0), // Raio da borda do botão
                            ),
                            padding: EdgeInsets.all(16.0),
                        ),
                        child: Text(
                        "Registrar Entrada",
                        style: TextStyle(fontSize: 24.0, color: Colors.white),
                        ),
                        onPressed: () {
                        _changePeople(1);
                        },
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:Colors.deepOrange,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0), // Raio da borda do botão
                                ),
                                padding: EdgeInsets.all(16.0),
                            ),
                            child: Text(
                            "Registrar Saída",
                            style: TextStyle(fontSize: 24.0, color: Colors.white),
                            ),
                            onPressed: () {
                            _changePeople(-1);
                            },
                        ),
                    ),
                ],
                ),//text
            ], //widget
            ),//Column
        ),
      ],
    );
  }
}
