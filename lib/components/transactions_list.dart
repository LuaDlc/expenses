// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions>? transactions;
//componente para exibiicao das transacoes com dados
  const TransactionsList(
    this.transactions, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions!.map((tr) {
        return Card(
          child: Row(
            children: [
              Container(
                // o container aqui é necessario pois precisa dele pra add estilos
                margin: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 137, 14, 159),
                      width: 2.0),
                ),
                padding: const EdgeInsets.all(10),
                child: Text(
                  'R\$ ${tr.value!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // titulo de data alinhados em uma coluna
                children: [
                  Text(
                    tr.title!,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(tr.date!),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color.fromARGB(255, 118, 116, 116),
                    ),
                  ), //to string pois text recebe tipo string
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
