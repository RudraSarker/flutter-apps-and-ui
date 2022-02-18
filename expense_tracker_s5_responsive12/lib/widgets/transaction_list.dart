import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList(this._userTransactions, this._deleteTransaction);
  final List<Transaction> _userTransactions;
  Function _deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return _userTransactions.isEmpty
        ? LayoutBuilder(builder: ((context, constraints) {
            return Column(
              children: [
                Text(
                  "No Entry Available!",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                  //Image Container for empty chart
                  height: constraints.maxHeight * 0.7,
                  child: Image.asset(
                    'assets/images/waiting1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          }))
        : ListView.builder(
            itemCount: _userTransactions.length,
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                          child: Text('${_userTransactions[index].amount}')),
                    ),
                  ),
                  title: Text(
                    _userTransactions[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(_userTransactions[index].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () =>
                        _deleteTransaction(_userTransactions[index].id),
                  ),
                ),
              );
            },
          );
  }
}
