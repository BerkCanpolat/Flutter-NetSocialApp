class UserModel{
  final String? email;
  final String? name;
  final String? password;
  final String? uid;


  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.uid,
  });

  Map<String,dynamic> toJson() => {
    "email":email,
    "name":name,
    "password":password,
    "uid":uid
  };
}