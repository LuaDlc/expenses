import 'package:expenses/components/adaptative_buttons.dart';
import 'package:expenses/components/adaptative_date_picker.dart';
import 'package:flutter/material.dart';

import 'adaptative_text_fields.dart';

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
    final value = double.tryParse(_valueController.text) ?? 0;
    //validacao para nao permitir caixa vazia ou sem valores validos
    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate!);
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
              children: [
                AdaptativeTextFields(
                  controller: _titleController,
                  //variaves diferentes para recebr valor e titulo
                  onSubmitted: (_) => _submitForm,
                  label: 'Titulo',
                ),
                AdaptativeTextFields(
                  label: 'Valor (R\$)',
                  //onsbmitted vai chamar a funcao pra adicionar os dados caso o usuario complete as info, direto no teclado
                  onSubmitted: (_) => _submitForm,
                  //(_)-> vazio pois onsubmit nao recebe parametro
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  controller: _valueController,
                ),
                //TODO: NOVO COMPONENTE
                AdaptativeDatePicker(
                    selectedDate: _selectedDate,
                    onDateChange: (newDate) {
                      setState(() {
                        _selectedDate = newDate;
                      });
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AdaptativeButtons(
                        label: 'Nova Transação', onPressed: _submitForm),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
