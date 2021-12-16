import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  late final String label;
  late final double spendingAmount;
  late final double spendingPctOfTotal;

  ChartBar({required this.label, required this.spendingAmount, required double totalSpending}) {
    if (totalSpending > 0) {
      spendingPctOfTotal = spendingAmount / totalSpending;
    } else {
      spendingPctOfTotal = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container( // So the text shrinks but the vertical space is not reduced
          height: 20,
          child: FittedBox( // Makes the child shrink instead of breaking lines
            child: Text("\$${spendingAmount.toStringAsFixed(0)}"),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.0),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(label),
      ],
    );
  }
}
