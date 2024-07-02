import 'package:flutter/material.dart';

import '../models/transaction.dart';

// Dummy data for demonstration
final List<Transaction> transactions = [
  Transaction(
    title: 'Pagamento recebido',
    description: 'Pagamento recebido de 125kz',
    date: DateTime(2024, 6, 30),
    amount: 150.0,
  ),
  Transaction(
    title: 'Transferência enviada',
    description: 'Transferência enviada a conta 20299399393 de 150kz',
    date: DateTime(2024, 6, 28),
    amount: -50.0,
  ),
  Transaction(
    title: 'Transferência Recebida',
    description: 'Recebeste uma transfência de 150kz',
    date: DateTime(2024, 6, 25),
    amount: -80.0,
  ),
];

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Histórico",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            title: Text(transaction.title),
            subtitle: Text(transaction.description),
            leading: const CircleAvatar(
              child: Icon(Icons.monetization_on),
            ),
            trailing: Text(
              '${transaction.amount >= 0 ? '+' : '-'} \$${transaction.amount.abs()}',
              style: TextStyle(
                color: transaction.amount >= 0 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
