import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double? percent;
  final double? value;
  final String? label;
  const ChartBar({super.key, this.percent, this.value, this.label});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(child: Text(value!.toStringAsFixed(2))),
          ), //posiciona os valores arredondados
          const SizedBox(height: 10),
          SizedBox(
            height: constraints.maxHeight * 0.6,
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
                SizedBox(
                    height: constraints.maxHeight * 0.5,
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
          SizedBox(height: constraints.maxHeight * 0.5),
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(child: Text(label!)),
          ),
          //ate aqui temos um column com os valores preenchendo a tela
        ],
      );
    });
  }
}
