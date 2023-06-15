import 'dart:math';

import 'package:expenses/components/transaction_form.dart';

import 'package:flutter/material.dart';

import 'components/transactions_list.dart';
import 'models/transactions.dart';

void main() => runApp(const Expenses());

class Expenses extends StatelessWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData tema = ThemeData();

    return MaterialApp(
      home: const MyHomePage(),
      theme: tema.copyWith(
          colorScheme: tema.colorScheme.copyWith(
            primary: Colors.purple,
            secondary: Colors.amber,
          ),
          textTheme: tema.textTheme.copyWith(
            titleLarge: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ))),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> _transactions = [
    // Transactions(
    //   id: 't1',
    //   title: 'tenis novo',
    //   value: 539.00,
    //   date: DateTime.now(),
    // ),
    // Transactions(
    //   id: 't2',
    //   title: 'luz',
    //   value: 238.00,
    //   date: DateTime.now(),
    // ),
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

    Navigator.of(context).pop();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm((_addTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              child: Card(
                color: Colors.blue, //pega a cor primaria/padrao do app definida
                elevation: 5,
                child: Text('Grafico'),
              ),
            ),
            TransactionsList(_transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(
              context)), //vai chamar o modal/form pra permitir add transacao
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, //centralizad o botao +
    );
  }
}
