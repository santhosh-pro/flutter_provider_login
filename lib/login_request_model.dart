class LoginRequestModel {
  String _username;

  String get username => _username;

  set username(String username) {
    _username = username;
  }
  String _password;

  String get password => _password;

  set password(String password) {
    _password = password;
  }
  LoginRequestModel();


  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
