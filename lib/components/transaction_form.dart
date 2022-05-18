import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {

  final void Function(String,double,DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  DateTime? _selectedDate;

  _submitForm(){
      final String title = titleController.text;
      final double value = double.tryParse(valueController.text)??0;
      if(title.isEmpty || value <=0 || _selectedDate == null){
        return;
      }
      widget.onSubmit(title,value,_selectedDate!);
  }

  _showDatePicker(){
    showDatePicker(
      context:context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate:  DateTime.now(),
    ).then((datePicker) {
      print(datePicker.toString());
      if(datePicker==null){
        return;
      }
      setState(() {
        _selectedDate = datePicker;
      });

      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (value)=>_submitForm(),
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_)=>_submitForm(),
              decoration: InputDecoration(
                labelText: 'Valor(R\$)',
              ),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        _selectedDate==null?
                        'Nenhuma data selecionada'
                    : DateFormat('dd/MM/y').format(_selectedDate!)),
                  ),
                  FlatButton(
                      textColor: Theme.of(context).colorScheme.primary,
                      child: Text('Selecionar data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      )
                      ),
                      onPressed: _showDatePicker,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RaisedButton(
                  onPressed: _submitForm,
                  child: Text('Nova Transação'),
                  color: Theme.of(context).colorScheme.primary,
                  textColor: Colors.white
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
