// User model for storing uid...
class UserModel{
  String? uid;
  String? firstName;
  String? lastName;
  String? email;
  String? password;

  UserModel({this.uid,this.firstName,this.lastName,this.email,this.password});

  /// get data from server ...
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
    );
  }

  /// send data to server...
  Map<String,dynamic> toMap(){
    return{
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
  }
}

class User{
  final String? uid;
  final String? email;

  User(this.uid,this.email);
}