import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactions;

  TransactionList(this.transactions, this.deleteTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: this.transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No Transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover))
                ],
              );
            })
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return Card(
                //   elevation: 5,
                //   child: Row(
                //     children: [
                //       Container(
                //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                //         decoration: BoxDecoration(
                //             border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           'Rs.${transactions[index].amount.toStringAsFixed(2)}',
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 18,
                //             color: Theme.of(context).primaryColor,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             transactions[index].title,
                //             style: Theme.of(context).textTheme.headline6
                //           ),
                //           Text(
                //             DateFormat.yMMMd().format(transactions[index].date),
                //             style: TextStyle(color: Colors.grey),
                //           )
                //         ],
                //       )
                //     ],
                //   ),
                // );
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text('Rs.${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    trailing: MediaQuery.of(context).size.width > 420
                        ? TextButton.icon(
                      icon: Icon(Icons.delete),
                      label: Text('Delete'),
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).errorColor,
                      ),
                      onPressed: () => this.deleteTransactions(transactions[index].id),)
                        : IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () =>
                                this.deleteTransactions(transactions[index].id),
                          ),
                    title: Text(
                      '${transactions[index].title}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        '${DateFormat.yMMMd().format(transactions[index].date)}'),
                  ),
                );
              },
              itemCount: this.transactions.length,
              // children: this.transactions.map((tx) {
              // }).toList(),
            ),
    );
  }
}
