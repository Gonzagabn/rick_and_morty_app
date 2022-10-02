import 'dart:convert';

AppError appErrorFromJson(String str) => AppError.fromJson(
      json.decode(str),
    );

String appErrorToJson(AppError data) => json.encode(data.toJson());

class AppError {
  AppError({this.erros, this.status = 0});

  List<String>? erros;
  int? status;

  factory AppError.fromJson(Map<String, dynamic> json) => AppError(
        erros: List<String>.from(json["erros"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "erros": List<dynamic>.from(erros!.map((x) => x)),
      };
  setStatus(s) => status = s;
}
