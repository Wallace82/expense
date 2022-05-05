import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
    final _listTrasaction = [
      Transaction(
          id: '1',
          title: 'Compra de Sapatos',
          value: 300.0,
          date: DateTime.now()
      ),
      Transaction(
          id: '2',
          title: 'Conta de telefone',
          value: 155.0,
          date: DateTime.now()
      ),
      Transaction(
          id: '2',
          title: 'Esscola das criancas',
          value: 150.0,
          date: DateTime.now()
      ),
      Transaction(
          id: '2',
          title: 'Conta de agua',
          value: 345.50,
          date: DateTime.now()
      ),
    ];


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
          Column(
            children: _listTrasaction.map((tr)  {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin:EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 2,
                          ),

                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                            'R\$ ${tr.value.toStringAsFixed(2)}',
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tr.title,
                            style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          ),
                          Text(
                              DateFormat('d MMM y').format(tr.date),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.grey[400],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                  );
                }).toList(),
         ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Titulo',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Valor(R\$)',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FlatButton(
                          onPressed: ()=>{},
                          child: Text(
                              'Nova Transação',
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.deepPurple
                                ),
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
          ],
      ),
    );
  }
}