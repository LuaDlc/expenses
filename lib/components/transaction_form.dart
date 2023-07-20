import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {Key? key}) : super(key: key);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime
      .now(); //com o dateTimeNow, torna a data atual selecionada por padrao

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;
    //validacao para nao permitir caixa vazia ou sem valores validos
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate!);
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

//componente parao formulario de transacoes
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: <Widget>[
                TextField(
                  controller:
                      _titleController, //variaves diferentes para recebr valor e titulo
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
                  controller: _valueController,
                  decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                ),
                Container(
                    height: 70,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(_selectedDate == null
                              ? 'Nenhuma transacao adicionada'
                              : DateFormat('dd/MM/y').format(_selectedDate!)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        TextButton(
                          onPressed: _showDatePicker,
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
          )),
    );
  }
}
