import 'dart:math';

import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constrains) {
              return Column(
                children: <Widget>[
                  Text(
                    'No Transactions',
                    style: Theme.of(context).textTheme.title,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constrains.maxHeight * 0.4,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView(
            children: <Widget>[
              ...transactions
                  .map((txt) => TransactionItem(
                      key: ValueKey(txt.id),
                      transactionItem: txt,
                      deleteTx: deleteTx))
                  .toList()
            ],
          );
  }
}
