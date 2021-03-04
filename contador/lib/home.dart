import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int contador = 0;
  String informacao = '';

  @override
  Widget build(BuildContext context) {
    return Stack (
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              // image: NetworkImage ('https://media-cdn.tripadvisor.com/media/photo-s/16/f1/e2/5b/o-caminho-da-felicidade.jpg'),
                image: AssetImage ('images/praia.jpg'),
                fit: BoxFit.fill
            ),
          ),
        ),
        // Image.asset('images/praia.jpg', fit: BoxFit.cover),
        Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              child: Text("Seja bem vindo ao restaurante!", style: TextStyle(color: Colors.black, fontSize: 25), textAlign: TextAlign.center),
              padding: EdgeInsets.only(bottom: 20),
            ),
            Padding(
              child: Text("Quantidade de pessoas: ${contador}", style: TextStyle(color: Colors.black, fontSize: 25), textAlign: TextAlign.center),
              padding: EdgeInsets.only(bottom: 20),
            ),
            Padding(
              child: Text('${informacao}', style: TextStyle(color: Colors.black, fontSize: 30), textAlign: TextAlign.center),
              padding: EdgeInsets.only(bottom: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.only(left: 30, right: 30), child: criarBotao(Icons.exposure_minus_1_rounded),),
                criarBotao(Icons.exposure_plus_1_rounded),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget criarBotao(IconData icon) {
    return FlatButton(
      onPressed: (){
        setState(() {

          if (icon == Icons.exposure_plus_1_rounded) {
            contador++;
          } else {
            contador--;
          }

          if (contador < 0) {
            contador = 0;
            informacao = 'O número de pessoas não pode ser negativo';
          } else {
            informacao = '';
          }

          if (contador >= 10) {
            contador = 10;
            informacao = "O restaurante está cheio!";
          }

        });
      },
      child: Icon(
        icon,
        color: Colors.black,
      ),
      color: Colors.white,
      height: 50,
      minWidth: 150,
    );
  }

}