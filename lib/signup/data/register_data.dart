/// cmd : "cookbook_backend.api.signup"
/// args : {"first_name":"John","last_name":"Doe","email":"johndoe@test.com","password":""}

class RegisterData {
  RegisterData({
      String? cmd, 
      Args? args,}){
    _cmd = cmd;
    _args = args;
}

  RegisterData.fromJson(dynamic json) {
    _cmd = json['cmd'];
    _args = json['args'] != null ? Args.fromJson(json['args']) : null;
  }
  String? _cmd;
  Args? _args;

  String? get cmd => _cmd;
  Args? get args => _args;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cmd'] = _cmd;
    if (_args != null) {
      map['args'] = _args?.toJson();
    }
    return map;
  }

}

/// first_name : "John"
/// last_name : "Doe"
/// email : "johndoe@test.com"
/// password : ""

class Args {
  Args({
      String? firstName, 
      String? lastName, 
      String? email, 
      String? password,}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;
}

  Args.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _password = json['password'];
  }
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _password;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['password'] = _password;
    return map;
  }

}