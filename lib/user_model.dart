import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  String username;
  String email;
  String age;
  String interest;

  User(
      {required this.username,
      required this.email,
      required this.age,
      required this.interest // Actualización del constructor para incluir el interés
      });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
