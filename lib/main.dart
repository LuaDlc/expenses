import 'dart:math';

import 'package:expenses/components/chart.dart';
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
  final List<Transactions> _transactions = [];

  List<Transactions> get _recentTransactions {
    return _transactions.where((tr) {
      // pega a lista de transacoes e faz um filtro
      return tr.date!.isAfter(DateTime.now().subtract(
        //se a data da transacao for de ate 7 dias
        const Duration(
            days:
                7), // com o dateTime é possivel saber, entao retorna uma sublista
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transactions(
      id: Random().nextDouble().toString(),
      title:
          title, //title: é o atributo e title é parametro da chamada da funcao _addTransaction
      value: value,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    // essa funcoa vai ser passada como parametro dentro da lista pois é la q o usuario vai clicar pr excluir
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id
          //com a transacao como parametro, remove a transacao
          // se o id da tr for igual ao id passado no parametro
          );
    });
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
    //resizeToAvoidBottomInset: false,
    final appBar = AppBar(
      title: const Text('Despesas Pessoais'),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        )
      ],
    );

    final availableHeight = MediaQuery.of(context).size.height -
        appBar.preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: availableHeight * 0.3,
              child: Chart(_recentTransactions),
            ),
            SizedBox(
              height: availableHeight * 0.7,
              child: TransactionsList(_transactions, _removeTransaction),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(
              context)), //vai chamar o modal/form pra permitir add transacao
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, //centeFloat
    );

    //centralizad o botao +
  }
}
