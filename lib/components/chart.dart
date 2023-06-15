import 'package:expenses/models/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;
  const Chart(
    this.recentTransactions, {
    super.key,
  });

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        bool sameDay = recentTransactions[i].date!.day == weekDay.day;
        bool sameMonth = recentTransactions[i].date!.month == weekDay.month;
        bool sameYear = recentTransactions[i].date!.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += recentTransactions[i].value!;
        }
      }
      print(DateFormat.E().format(weekDay)[0]);
      print(totalSum);

      return {
        'day': DateFormat.E()
            .format(weekDay)[0], //pegando a primeira letra do dia da semana:
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 6, //para destaque
      margin: EdgeInsets.all(20), //margin para destaque de cada componente
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}