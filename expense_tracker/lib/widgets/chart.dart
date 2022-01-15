import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:expense_tracker/models/transaction.dart';

class Chart extends StatelessWidget {
  // const Chart({ Key? key }) : super(key: key);
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    final currentDay = DateTime.now();

    return List.generate(7, // Weekdays
        (index) {
      final weekDay = currentDay.subtract(Duration(days: index));
      double totalSum = 0;

      for (var i = 0; i < recentTransactions.length; i++) {
        final txDate = recentTransactions[i].date;
        if (txDate.day == weekDay.day &&
            txDate.month == weekDay.month &&
            txDate.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay)[0], 'amount': totalSum};
    });
  }

  double get totalSpending {
    final double total = groupedTransactionValues.fold(
        0.0,
        (previousValue, element) =>
            previousValue + (element['amount'] as double));
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
          children: groupedTransactionValues.map((data) {
            final double percentage = totalSpending != 0
                ? (data['amount'] as double) / totalSpending
                : 0;
            return ChartBar(
              label: data['day'] as String,
              spentAmount: data['amount'] as double,
              spentPercentage: percentage,
            );
          }).toList(),
        ));
  }
}
