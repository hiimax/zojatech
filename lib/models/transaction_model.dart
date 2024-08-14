class TransactionModel {
  int? id;
  String? date;
  String? description;
  String? title;
  String? type;
  String? status;
  String? amount;

  // Constructor with optional 'id' parameter
  TransactionModel(this.title, this.description, this.date, this.type,
      this.status, this.amount, this.id);

  // columns in the database.
  TransactionModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    date = map['date'];
    type = map['type'];
    status = map['status'];
    amount = map['amount'];
  }

// Method to convert a 'TransactionModel' to a map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'type': type,
      'status': status,
      'amount': amount
    };
  }
}
