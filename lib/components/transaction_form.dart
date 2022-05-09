import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String,double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm(){
      final String title = titleController.text;
      final double value = double.tryParse(valueController.text)??0;
      if(title.isEmpty || value <=0){
        return;
      }
      onSubmit(title,value);
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  onPressed: _submitForm,
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
    );
  }
}