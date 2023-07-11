import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double) onSubmit;

  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;
    //validacao para nao permitir caixa vazia ou sem valores validos
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value);
  }

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
                smartQuotesType:
                    SmartQuotesType.enabled, //permite apenas numerosf
                //onsbmitted vai chamar a funcao pra adicionar os dados caso o usuario complete as info, direto no teclado
                onSubmitted: (_) => widget
                    .onSubmit, //(_)-> vazio pois onsubmit nao recebe parametro
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                controller: valueController,
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
              ),
              Container(
                  height: 70,
                  child: Row(
                    children: [
                      const Text('Nenhuma transacao adicionada'),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Selecionar data',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  )),
              TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.purple),
                onPressed: _submitForm,
                child: const Text(
                  'Nova Transacao',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ));
  }
}
