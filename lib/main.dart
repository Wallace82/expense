import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Despesas'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Container(
          child:
          Card(
            color: Colors.blue,
            child: Text('Grafico'),
            elevation: 5,
          ),
        ),
        Card(
        child: Text('Lista de transações'),)
    ,

    ]
    ,
    )
    ,
    );
  }
}
