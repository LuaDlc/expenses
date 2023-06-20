import 'package:expenses/components/chart_bar.dart';
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
    groupedTransactions;
    return Card(
      elevation: 6, //para destaque
      margin:
          const EdgeInsets.all(20), //margin para destaque de cada componente
      child: Row(
        children: groupedTransactions.map((tr) {
          //pega alista q é um map de chave e valor, e tr de transacao pega dia e valor
          return ChartBar(
            //retorna o componente com o valor, dia e a porcentagem
            label: tr['day'] as String,
            value: tr['value'] as double,
            percent: 0,
          );
        }).toList(),
      ),
    );
  }
}
