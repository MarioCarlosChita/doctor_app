class User {
  int id;
  String email;
  String password;
  String token;
  String username;
  int pkUsuario;
  int tipo_Usuario;
  //String ;
  User({this.token,this.username, this.email, this.password});

  User.initial()
      : id = 0,
        email = '',
        password = '',
        token ='';

  User.fromJson(Map<String, dynamic> json) {
    token= json['token'];
    username =json['username'];
    email = json['email'];
    password = json['password'];
    pkUsuario =json['pkUsuario'];
    tipo_Usuario =json['tipo_Usuario'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.id;
    data['name'] = this.email;
    data['username'] = this.password;
    return data;
  }
}