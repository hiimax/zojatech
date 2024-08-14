class UserModel {
  int? id;
  String? name;
  String? password;
  String? email;
  String? image;
  String? token;

  // Constructor with optional 'id' parameter
  UserModel(this.name, this.email, this.image, this.password,this.token, {this.id});

  // columns in the database.
  UserModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    email = map['email'];
    image = map['image'];
    password = map['password'];
    token = map['token'];
  }

// Method to convert a 'UserModel' to a map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'image': image,
      'password': password,
      'token': token
    };
  }
}
