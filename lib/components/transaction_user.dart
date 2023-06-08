import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transactions_list.dart';
import 'package:flutter/material.dart';

import '../models/transactions.dart';

//componente para a lista de transacoes do usuario
class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transactions(
      id: 't1',
      title: 'tenis novo',
      value: 539.00,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: 'luz',
      value: 238.00,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transactions(
      id: Random().nextDouble().toString(),
      title:
          title, //title: é o atributo e title é parametro da chamada da funcao _addTransaction
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  //dentro do setState vamos alterar a lista

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionsList(_transactions),
        TransactionForm(_addTransaction),
      ],
    );
  }
}
