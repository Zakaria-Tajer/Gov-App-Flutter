class Transactions {
  String transactionId;
  String transactionName;
  String transactionDescription;
  String transactionDate;

  Transactions(
      {required this.transactionId,
      required this.transactionName,
      required this.transactionDescription,
      required this.transactionDate});

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      transactionId: json['transactionId'] as String,
      transactionName: json['transactionName'] as String,
      transactionDescription: json['transactionDescription'] as String,
      transactionDate: json['transactionDate'] as String,
    );
  }
}
