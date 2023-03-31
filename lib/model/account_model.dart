class Account{
  String? email;
  String? password;
  String? phone;
  String? userName;

  Account(this.userName, this.email, this.phone, this.password);

  Account.fromJson(Map<String, dynamic> json)
      : userName = json['username'],
        email = json['email'],
        phone = json['phoneNumber'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'username':userName,
    'email':email,
    'phoneNumber':phone,
    'password':password
  };
}