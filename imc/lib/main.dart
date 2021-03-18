import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerName = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(mask: '+## (##) ####-####');
  String valor = "";

  void refresh(){
    setState(() {
      valor = _controllerName.text = "";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'MENU GESBOSS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text("Meu App Bar"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.refresh_sharp), onPressed: () {
            setState(() {
              refresh();
            });
          }),
        ]
      ),
      body:  SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, right: 40, left: 20, bottom: 15),
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Dólar Hoje:', // default text style
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text: "RS 5,69",
                        style: TextStyle(fontWeight: FontWeight.bold)
                      ),
                    ),

                    TextFormField(
                      inputFormatters: [maskFormatter],
                      keyboardType: TextInputType.phone,
                      controller: _controllerName,
                      obscureText: false,
                      decoration: InputDecoration(
                        icon: Icon(Icons.attach_money_rounded),
                        labelText: "Valor:"
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return "Informe seu nome..";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    setState(() {
                      valor = _controllerName.value.text;
                    });
                  }
                }, child: Text("Calcular"),
              ),
              RichText(
                text: TextSpan(
                  text: 'R\$59,00',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      color: Colors.black
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}
