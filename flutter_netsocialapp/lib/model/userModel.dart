class UserModel{
  final String? email;
  final String? name;
  final String? password;
  final String? uid;
  final String? userName;


  UserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.uid,
    required this.userName,
  });

  Map<String,dynamic> toJson() => {
    "email":email,
    "name":name,
    "password":password,
    "uid":uid,
    "userName":userName
  };
}