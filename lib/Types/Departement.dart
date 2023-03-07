import 'package:govapp/Types/Transactions.dart';

class Departement {
  String departementId;
  String departmentName;
  String departmentJob;
  List<Transactions> transactions;

  Departement(
      {required this.departementId,
      required this.departmentName,
      required this.departmentJob,
      required this.transactions});

  factory Departement.fromJson(Map<String, dynamic> json) {
    var transactionsList = json['transactions'] as List;
    List<Transactions> transactions =
        transactionsList.map((item) => Transactions.fromJson(item)).toList();

    return Departement(
      departementId: json['departementId'] as String,
      departmentName: json['departmentName'] as String,
      departmentJob: json['departmentJob'] as String,
      transactions: transactions,
    );
  }

  @override
  String toString() {
    return 'Departement{departementId: $departementId, departmentName: $departmentName, departmentJob: $departmentJob, transactions: $transactions}';
  }
}
