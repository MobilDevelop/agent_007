class Registration{
  String? login;
  String? parol;

  Registration({this.login, this.parol});

  factory Registration.fromJson(Map<String,dynamic> json)=>Registration(
    login: json['username'],
    parol: json['password']
  );

  Map<String,dynamic> toJson()=>{
    'username':login,
    'password':parol
  };
}