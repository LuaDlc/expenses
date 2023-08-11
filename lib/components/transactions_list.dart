// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:expenses/components/transaction_item.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';

class TransactionsList extends StatelessWidget {
  final List<Transactions>? transactions;
  final void Function(String) onRemove;
//componente para exibiicao das transacoes com dados
  const TransactionsList(
    this.transactions,
    this.onRemove, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions!.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Nenhuma transacao cadastrada',
                    style: TextStyle(fontSize: 10, color: Colors.purple),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions!.length, //pega cada item q esta na tela
            itemBuilder: (ctx, index) {
              //index é o item que quero renderizar na tela
              final tr = transactions![index];
              return TransactionItem(tr: tr, onRemove: onRemove);
            },
          );
  }
}
