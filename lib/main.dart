import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}


class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weigetController = TextEditingController();
  TextEditingController heigetController = TextEditingController();

  String _infoText = "Informe seus dados";

  void _resetFields(){
    weigetController.text = "";
    heigetController.text = "";
    setState(() {
      _infoText = "Informe seus dados";  
    });
  }

  void _calcular(){
    setState(() {
      double weight = double.parse(weigetController.text);
      double height = double.parse(heigetController.text) / 100;
      double imc = weight / (height * height);
      String strImc = imc.toStringAsPrecision(4);

      if (imc <= 18.6){
        _infoText = "Abaixo do peso ($strImc)";
      } else if (imc <= 24.8){
        _infoText = "Peso ideal ($strImc)";
      } else if (imc <= 29.8){
        _infoText = "Levemente acima do peso ($strImc)";
      } else if (imc <= 34.8){
        _infoText = "Obesidade grau I ($strImc)";
      } else if (imc <= 39.8){
        _infoText = "Obesidade grau II ($strImc)";
      } else {
        _infoText = "Obesidade grau III ($strImc)";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 136, 243),
        actions: <Widget>[
          IconButton(onPressed: _resetFields,
          icon: Icon(Icons.refresh)
          )
        ]
      ),
      backgroundColor: const Color.fromARGB(255, 175, 209, 236),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.person_outline_sharp, size: 140.0,
          color: Colors.blue),
          TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
              labelText: "Peso (kg)",
              labelStyle: TextStyle(color: Colors.blue)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue, fontSize: 25),
            controller: weigetController,
          ),

          TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Altura(cm)",
            labelStyle: TextStyle(color: Colors.blue)
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue, fontSize: 25.0),
          controller: heigetController,
          ),
          Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Container(
            height: 40.0,
            child: ElevatedButton(onPressed: _calcular,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue
            ),
            child: Text("Calcular", style: TextStyle(
              color: Colors.white,
              fontSize: 25.0),
              ),
            ),
          ),
          ),
          Text(_infoText,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.blue, fontSize: 22.0)
          )
        ],
      )
      )
    );
  }
}
