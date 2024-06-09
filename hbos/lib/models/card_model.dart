import 'dart:convert';

class CardModel {
  String? Cardid;
  int? cardNummber;
  DateTime? createdDate;
  DateTime? endedDate;
  String? cardName;

  CardModel({
    this.Cardid,
    this.createdDate,
    this.endedDate,
    this.cardNummber,
    this.cardName,
  });

  factory CardModel.fromJson(Map<String, dynamic> parsedJson) {
    return CardModel(
      Cardid: parsedJson['Cardid'],
      cardNummber: parsedJson['cardNummber'],
      createdDate: parsedJson['createdDate'] != null
          ? parsedJson['createdDate'].toDate()
          : parsedJson['createdDate'],
      endedDate: parsedJson['endedDate'] != null
          ? parsedJson['endedDate'].toDate()
          : parsedJson['endedDate'],
      cardName: parsedJson['cardName'],
    );
  }

  static List<CardModel> listFromJson(List<dynamic> list) {
    List<CardModel> rows = list.map((i) => CardModel.fromJson(i)).toList();
    return rows;
  }

  static List<CardModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<CardModel>((json) => CardModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        'Cardid': Cardid,
        'cardNummber': cardNummber,
        'createdDate': createdDate,
        'endedDate': endedDate,
        'cardName': cardName,
      };
}
