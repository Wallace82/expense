import 'dart:math';

import 'package:expense/components/transaction_form.dart';
import 'package:expense/components/transaction_list.dart';
import 'package:expense/models/transaction.dart';
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

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




class _MyHomePageState extends State<MyHomePage> {


  final List<Transaction> _trasactions = [
    // Transaction(
    //     id: '1',
    //     title: 'Compra de Sapatos',
    //     value: 300.0,
    //     date: DateTime.now()
    // ),
    // Transaction(
    //     id: '2',
    //     title: 'Conta de agua',
    //     value: 345.50,
    //     date: DateTime.now()
    // ),

  ];

  _addTransction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    Navigator.of(context).pop();
    
    setState(() {
      _trasactions.add(newTransaction);
    });
  }


  _openTransactionFormModal(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (_){
          return TransactionForm(_addTransction);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: ()=>_openTransactionFormModal(context),
            icon: Icon(Icons.add),
            color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            children: [
              _trasactions.isEmpty? Column(
                children: [
                  SizedBox(height: 20),
                  Text('Lista Vazia'),
                  SizedBox(height: 20),
                  Container(
                    height: 300,
                      child: Image.asset(
                          'assets/images/img.png',
                        fit:BoxFit.cover
                      ),


                  ),
                ],
              ) : TransactionList(_trasactions),
            ],
          ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=>_openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}