class ProductModel {
  int? id;
  String? title;
  String? description;
  String? status;
  String? category;
  String? date;

  ProductModel(this.title, this.description, this.status, this.category,
      this.date, this.id);

  ProductModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    status = map['status'];
    category = map['category'];
    date = map['date'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'status': status,
      'category': category,
      'id': id,
      'date': date
    };
  }
}
