class Data {
  int? id;
  String? username;
  String? email;
  String? password;
  bool? isEmailVerified;
  int? v;
  String? token;

  Data({
    this.id,
    this.username,
    this.email,
    this.password,
    this.isEmailVerified,
    this.v,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      isEmailVerified: json['isEmailVerified'],
      v: json['__v'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'password': password,
      'isEmailVerified': isEmailVerified,
      '__v': v,
      'token': token,
    };
  }
}

class UserResponse {
  int? statusCode;
  Data? data;
  String? message;
  bool? success;

  UserResponse({
    this.statusCode,
    this.data,
    this.message,
    this.success,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      statusCode: json['statusCode'],
      data: Data.fromJson(json['data']),
      message: json['message'],
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'data': data?.toJson(),
      'message': message,
      'success': success,
    };
  }
}
