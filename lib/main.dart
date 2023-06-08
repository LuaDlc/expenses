import 'package:expenses/components/transaction_user.dart';

import 'package:flutter/material.dart';

void main() => runApp(const Expenses());

class Expenses extends StatelessWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Grafico'),
              ),
            ),
            TransactionUser() //apenas um componente pra termos a lista e o form exibidos na tela
          ],
        ),
      ),
    );
  }
}
