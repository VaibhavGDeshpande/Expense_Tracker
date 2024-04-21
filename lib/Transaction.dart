import 'package:flutter/material.dart';

void main() {
  runApp(TransactionScreen());
}

class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Transactions'),
          centerTitle: true,
        ),
        body: TransactionBody(),
      ),
    );
  }
}

class TransactionBody extends StatefulWidget {
  @override
  _TransactionBodyState createState() => _TransactionBodyState();
}

class _TransactionBodyState extends State<TransactionBody> {
  String _selectedFilter = 'Daily';
  List<Transaction> _transactions = [
    Transaction(
      type: TransactionType.expense,
      amount: 50.0,
      category: 'Food',
      description: 'Lunch at restaurant',
      date: DateTime.now(),
    ),
    Transaction(
      type: TransactionType.income,
      amount: 100.0,
      category: 'Salary',
      description: 'Monthly salary',
      date: DateTime.now(),
    ),
    Transaction(
      type: TransactionType.expense,
      amount: 30.0,
      category: 'Transport',
      description: 'Taxi fare',
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            width: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _selectedFilter,
                items: ['Daily', 'Weekly', 'Monthly', 'Yearly']
                    .map((String filter) {
                  return DropdownMenuItem<String>(
                    value: filter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(filter),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedFilter = value!;
                  });
                  // Add functionality to filter transactions
                },
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (context, index) {
              Transaction transaction = _transactions[index];
              return ListTile(
                leading: Icon(
                  transaction.type == TransactionType.income
                      ? Icons.arrow_circle_up
                      : Icons.arrow_circle_down,
                  color: transaction.type == TransactionType.income
                      ? Colors.green
                      : Colors.red,
                ),
                title: Text(
                  '${transaction.type == TransactionType.income ? '+' : '-'} \₹${transaction.amount.toString()}',
                  style: TextStyle(
                    color: transaction.type == TransactionType.income
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.category,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(transaction.description),
                  ],
                ),
                trailing: Text(
                  '${transaction.date.day}/${transaction.date.month}/${transaction.date.year}',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class Transaction {
  final TransactionType type;
  final double amount;
  final String category;
  final String description;
  final DateTime date;

  Transaction({
    required this.type,
    required this.amount,
    required this.category,
    required this.description,
    required this.date,
  });
}

enum TransactionType { income, expense }
