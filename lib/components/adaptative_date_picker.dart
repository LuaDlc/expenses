// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime)? onDateChange;

  const AdaptativeDatePicker({
    Key? key,
    this.selectedDate,
    this.onDateChange,
  }) : super(key: key);

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onDateChange ?? (pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? SizedBox(
            height: 180,
            child: CupertinoDatePicker(
              onDateTimeChanged: onDateChange!,
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2019),
              maximumDate: DateTime.now(),
            ),
          )
        : SizedBox(
            height: 70,
            child: Row(
              children: [
                Text(
                  selectedDate == null
                      ? 'Nenhuma transacao adicionada'
                      : 'Data selecionada: ${DateFormat('dd/MM/y').format(selectedDate!)}',
                ),
                TextButton(
                  onPressed: () => _showDatePicker(context),
                  child: const Text('Selecionar data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                )
              ],
            ));
  }
}
