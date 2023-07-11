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
        Container(
          height: 20,
          child: FittedBox(child: Text(value!.toStringAsFixed(2))),
        ), //posiciona os valores arredondados
        const SizedBox(height: 10),
        SizedBox(
          height: 60,
          width: 10, // coloca altura e largura no componente do grafico
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5)),
              ),
              FractionallySizedBox(
                  heightFactor: percent,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(5)),
                  ))
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(label!),
        //ate aqui temos um column com os valores preenchendo a tela
      ],
    );
  }
}
