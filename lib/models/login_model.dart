class LoginModel {
  late bool? status;
  late String? massage;
  LoginDataModel? data;

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    massage = json['message'];
    data = json['data'] != null ? LoginDataModel.fromJson(json['data']) : null;
  }
}

class LoginDataModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
