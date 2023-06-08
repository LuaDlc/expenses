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
      title: 'roupa da shein',
      value: 238.00,
      date: DateTime.now(),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionsList(_transactions),
        TransactionForm(),
      ],
    );
  }
}
