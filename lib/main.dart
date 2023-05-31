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
        children: <Widget>[
          const SizedBox(
            child: Card(
              color: Colors.blue,
              child: Text('Grafico'),
              elevation: 5,
            ),
          ),
          Column(
              children: _transactions.map((tr) {
            return Card(
                child: Row(
              children: <Widget>[
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
                    tr.value.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // titulo de data alinhados em uma coluna
                  children: <Widget>[
                    Text(
                      tr.title!,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(tr.date.toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 118, 116, 116),
                        )), //to string pois text recebe tipo string
                  ],
                )
              ],
            ));
          }).toList())
        ],
      ),
    );
  }
}
