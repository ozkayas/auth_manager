class RegisterResponseModel {
  String? token;
  int? id;

  RegisterResponseModel({this.token, this.id});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
  }
}
