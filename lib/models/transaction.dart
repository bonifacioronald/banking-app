class Transaction {
  String category;
  String details;
  String logoUrl;
  String amount;
  String date;
  bool isExpense;

  Transaction(
      {required this.category,
      required this.details,
      required this.logoUrl,
      required this.amount,
      required this.date,
      required this.isExpense});
}
