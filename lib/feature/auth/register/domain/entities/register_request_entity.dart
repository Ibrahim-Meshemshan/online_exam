class RegisterRequestEntity {
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? rePassword;
  String? phone;

  // Constructor
  RegisterRequestEntity({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });
}
