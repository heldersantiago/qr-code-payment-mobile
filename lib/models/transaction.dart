class Transaction {
  final String title;
  final String description;
  final DateTime date;
  final double amount;

  Transaction({
    required this.title,
    required this.description,
    required this.date,
    required this.amount,
  });
}
