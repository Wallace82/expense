import 'dart:math';

import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:expense/components/transaction_form.dart';
import 'package:expense/components/transaction_list.dart';

class TransactionUser extends StatefulWidget {
  @override
  _TransactionUserState createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _listTrasaction = [
    Transaction(
        id: '1',
        title: 'Compra de Sapatos',
        value: 300.0,
        date: DateTime.now()
    ),
    Transaction(
        id: '2',
        title: 'Conta de agua',
        value: 345.50,
        date: DateTime.now()
    ),
    Transaction(
        id: '2',
        title: 'Conta de agua',
        value: 345.50,
        date: DateTime.now()
    ),
    Transaction(
        id: '2',
        title: 'Conta de agua',
        value: 345.50,
        date: DateTime.now()
    ),
    Transaction(
        id: '2',
        title: 'Conta de agua',
        value: 345.50,
        date: DateTime.now()
    ),
    Transaction(
        id: '2',
        title: 'Conta de agua 3',
        value: 345.50,
        date: DateTime.now()
    ),
    Transaction(
        id: '2',
        title: 'Conta de agua 2',
        value: 345.50,
        date: DateTime.now()
    ),
    Transaction(
        id: '2',
        title: 'Conta de agua 1',
        value: 345.50,
        date: DateTime.now()
    ),
    Transaction(
        id: '2',
        title: 'Olá',
        value: 345.50,
        date: DateTime.now()
    ),
    Transaction(
        id: '2',
        title: 'Teste',
        value: 345.50,
        date: DateTime.now()
    ),
  ];

  _addTransction(String title, double value){
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now(),
    );

   setState(() {
      _listTrasaction.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TransactionForm(_addTransction),
          TransactionList(_listTrasaction),
        ],
      ),
    );
  }
}
