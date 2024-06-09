import 'dart:convert';
import 'dart:io';

class UserModel {
  String? id;
  String? email;
  String? name;
  String? imagePath;
  String? city;
  int? age;
  String? sex;
  DateTime? createdDate;
  DateTime? lastLoginDate;
  String? langCode;
  String? fcmToken;
  int? showDiamonds;
  int? realDiamonds;
  int? realAmount;

  File? imageFile;

  UserModel(
      {this.id,
      this.email,
      this.name,
      this.imagePath,
      this.city,
      this.age,
      this.sex,
      this.createdDate,
      this.lastLoginDate,
      this.langCode,
      this.imageFile,
      this.fcmToken,
      this.realDiamonds,
      this.realAmount,
      this.showDiamonds});

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
      id: parsedJson['id'],
      email: parsedJson['email'],
      name: parsedJson['name'],
      imagePath: parsedJson['imagePath'],
      city: parsedJson['city'],
      age: parsedJson['age'],
      sex: parsedJson['sex'],
      createdDate: parsedJson['createdDate'] != null
          ? parsedJson['createdDate'].toDate()
          : parsedJson['createdDate'],
      lastLoginDate: parsedJson['lastLoginDate'] != null
          ? parsedJson['lastLoginDate'].toDate()
          : parsedJson['lastLoginDate'],
      langCode: parsedJson['langCode'],
      fcmToken: parsedJson['fcmToken'],
      showDiamonds: parsedJson['showDiamonds'],
      realAmount: parsedJson['realAmount'],
      realDiamonds: parsedJson['realDiamonds'],
    );
  }

  static List<UserModel> listFromJson(List<dynamic> list) {
    List<UserModel> rows = list.map((i) => UserModel.fromJson(i)).toList();
    return rows;
  }

  static List<UserModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<UserModel>((json) => UserModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'imagePath': imagePath,
        'city': city,
        'age': age,
        'sex': sex,
        'createdDate': createdDate,
        'lastLoginDate': lastLoginDate,
        'langCode': langCode,
        'fcmToken': fcmToken,
        'showDiamonds': showDiamonds,
        'realDiamonds': realDiamonds,
        'realAmount': realAmount,
      };
}
