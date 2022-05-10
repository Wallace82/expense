import 'package:expense/components/chart_bar.dart';
import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

  final List<Transaction> recetTransaction;

  Chart(this.recetTransaction);

  List<Map<String,Object>> get goupedTransaction{
    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(
        Duration(days:index),
      );

      double totalSum = 0.0;

      for(var i = 0;i<recetTransaction.length;i++){

        bool sameDay =  recetTransaction[i].date.day == weekDay.day;
        bool sameMonth =  recetTransaction[i].date.month == weekDay.month;
        bool sameYear =  recetTransaction[i].date.year == weekDay.year;

        if(sameDay && sameMonth && sameYear){
          totalSum += recetTransaction[i].value;
        }
      }

      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);
      return {
        'day':DateFormat.E().format(weekDay)[0],
        'value':totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    goupedTransaction;
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(20),
      child: Row(
          children: goupedTransaction.map((tr) {
                return ChartBar(
                  label : tr['day'].toString(),
                  value : double.tryParse(tr['value'].toString())??0.0,
                  percentage: 0.3,
                );
              }).toList(),
            ),
      );
  }
}
