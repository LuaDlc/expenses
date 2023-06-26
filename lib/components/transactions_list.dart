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
    return SizedBox(
        height: 300,
        child: transactions!.isEmpty
            ? Column(
                children: <Widget>[
                  const Text('Nenhuma transacao cadastrada'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemCount: transactions!.length, //pega cada item q esta na tela
                itemBuilder: (ctx, index) {
                  //index é o item que quero renderizar na tela
                  final tr = transactions![index];
                  return Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(
                              6), //para colcoar espacamento dentro do circle
                          child: FittedBox(
                            // para alinhar o texto no circleavatar
                            child: Text('R\$${tr.value}'),
                          ),
                        ),
                      ),
                      title: Text(
                        tr.title!,
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(DateFormat('d MMM y').format(tr.date!)),
                    ),
                  );
                },
              ));
  }
}
