import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit, {Key? key}) : super(key: key);
//componente parao formulario de transacoes
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller:
                    titleController, //variaves diferentes para recebr valor e titulo
                decoration: const InputDecoration(labelText: 'Titulo'),
              ),
              TextField(
                controller: valueController,
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              ),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {
                  final title = titleController.text;
                  final value = double.tryParse(valueController.text) ?? 0.0;
                  onSubmit(title, value);
                },
                child: const Text(
                  'Nova Transacao',
                  style: TextStyle(color: Colors.purple),
                ),
              )
            ],
          ),
        ));
  }
}
