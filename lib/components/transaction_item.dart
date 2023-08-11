import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transactions.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.tr,
    required this.onRemove,
  });

  final Transactions tr;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
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
                child: Text(
                  'R\$${tr.value}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          title: Text(
            tr.title!,
            style: const TextStyle(color: Colors.black),
          ),
          subtitle: Text(DateFormat('d MMM y').format(tr.date!)),
          trailing: MediaQuery.of(context).size.height > 480
              ? TextButton.icon(
                  icon: const Icon(Icons.delete),
                  label: const Text('Excluir'),
                  onPressed: () {
                    onRemove(tr.id!);
                  },
                )
              : IconButton(
                  onPressed: () => onRemove(tr.id!),
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))),
    );
  }
}
