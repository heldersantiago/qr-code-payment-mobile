class Account {
  final int? id;
  final int? userId;
  final int? identifier;
  final String? balance;

  Account({
    this.id,
    this.userId,
    this.identifier,
    this.balance,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      userId: json['userId'],
      identifier: json['identifier'],
      balance: json['balance'],
    );
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'identifier': identifier,
        'balance': balance,
      };
}
