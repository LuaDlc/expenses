import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double? percent;
  final double? value;
  final String? label;
  const ChartBar({super.key, this.percent, this.value, this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
            'R\$${value!.toStringAsFixed(2)}'), //posiciona os valores arredondados
        const SizedBox(height: 20),
        Container(
          height: 60,
          width: 30, // coloca altura e largura no componente do grafico
          child: null,
        ),
        const SizedBox(height: 20),
        Text(label!),
        //ate aqui temos um column com os valores preenchendo a tela
      ],
    );
  }
}
