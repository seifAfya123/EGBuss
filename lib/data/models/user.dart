class UserModel {
  String? name;
  String phone;
  String password;
  String? cPassword;
  String? email;

  UserModel({
    this.name,
    required this.phone,
    required this.password,
    this.cPassword,
    this.email,
  });
}
