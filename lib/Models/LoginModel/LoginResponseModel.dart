class LoginResponseModel {
  bool? status;
  Data? data;
  String? message;

  LoginResponseModel({this.status, this.data, this.message});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? id;
  String? email;
  String? password;
  String? name;
  String? image;
  String? designation;
  String? company;
  String? forgotPasswordCode;
  String? status;
  String? createdDate;

  Data(
      {this.id,
      this.email,
      this.password,
      this.name,
      this.image,
      this.designation,
      this.company,
      this.forgotPasswordCode,
      this.status,
      this.createdDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    image = json['image'];
    designation = json['designation'];
    company = json['company'];
    forgotPasswordCode = json['forgot_password_code'];
    status = json['status'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['image'] = this.image;
    data['designation'] = this.designation;
    data['company'] = this.company;
    data['forgot_password_code'] = this.forgotPasswordCode;
    data['status'] = this.status;
    data['created_date'] = this.createdDate;
    return data;
  }
}
