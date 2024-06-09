import 'dart:convert';

class ProccesModel {
  String? proccesId;
  int? proccesAmount;
  DateTime? proccesDate;
  String? proccesType;

  ProccesModel({
    this.proccesId,
    this.proccesAmount,
    this.proccesDate,
    this.proccesType,
  });

  factory ProccesModel.fromJson(Map<String, dynamic> parsedJson) {
    return ProccesModel(
      proccesId: parsedJson['proccesId'],
      proccesAmount: parsedJson['proccesAmount'],
      proccesDate: parsedJson['proccesDate'] != null
          ? parsedJson['proccesDate'].toDate()
          : parsedJson['proccesDate'],
      proccesType: parsedJson['proccesType'],
    );
  }

  static List<ProccesModel> listFromJson(List<dynamic> list) {
    List<ProccesModel> rows =
        list.map((i) => ProccesModel.fromJson(i)).toList();
    return rows;
  }

  static List<ProccesModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<ProccesModel>((json) => ProccesModel.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'proccesId': proccesId,
        'proccesAmount': proccesAmount,
        'proccesDate': proccesDate,
        'proccesType': proccesType,
      };
}
