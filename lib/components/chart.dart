import 'package:expense/components/chart_bar.dart';
import 'package:expense/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

      return {
        //'day':DateFormat.E().format(weekDay)[0],
        'day':DateFormat.E('pt_BR').format(weekDay),
        'value':totalSum,
      };
    }).reversed.toList();
  }

  double get _weeTotalValue{
    return goupedTransaction.fold(0.0, (sum,tr){
      return sum + (tr['value'] as double);
    });
  }


  @override
  Widget build(BuildContext context) {
    goupedTransaction;
    print(_weeTotalValue);
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: goupedTransaction.map((tr) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                      label : tr['day'].toString(),
                      value : double.tryParse(tr['value'].toString())??0.0,
                      percentage:  _weeTotalValue==0?0: (tr['value'] as double) / _weeTotalValue,
                    ),
                  );
                }).toList(),
              ),
      ),
      );
  }
}
