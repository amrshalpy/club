class UserModel {
  String? id;
  String? name;
  String? email;
  String? password;
  bool? isAdmin ;

  UserModel({this.id, this.isAdmin,this.email, this.name, this.password});
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    isAdmin = json['isAdmin'];
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'isAdmin': isAdmin,
    };
  }
}
