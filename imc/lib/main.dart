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
                padding: EdgeInsets.only(right: 40, left: 20, bottom: 15),
                child: TextFormField(
                  inputFormatters: [maskFormatter],
                  keyboardType: TextInputType.phone,
                  controller: _controllerName,
                  obscureText: false,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      labelText: "Nome"
                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                    return "Informe seu nome..";
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState.validate()){
                    setState(() {
                      valor = _controllerName.value.text;
                    });
                  }
                }, child: Text("Calcular")
              ),
            ]
          ),
        )
      ),
    );
  }
}
