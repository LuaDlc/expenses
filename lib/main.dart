import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Expenses());

class Expenses extends StatelessWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const <Widget>[
          SizedBox(
            child: Card(
              color: Colors.blue,
              child: Text('Grafico'),
              elevation: 5,
            ),
          ),
          Column(
              children: _transactions.map((tr) {
            return const Card(
              child: Text(tr.title),
            );
          }).toList())
        ],
      ),
    );
  }
}
