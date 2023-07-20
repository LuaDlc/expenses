// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                  const Text('Nenhuma transacao cadastrada'),
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
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
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
                  trailing: MediaQuery.of(context).size.height > 480
                      ? IconButton(
                          onPressed: () => onRemove(tr.id!),
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                      : TextButton.icon(
                          icon: const Icon(Icons.delete),
                          label: const Text('Excluir'),
                          onPressed: () {
                            onRemove(tr.id!);
                          },
                        ),
                ),
              );
            },
          );
  }
}
