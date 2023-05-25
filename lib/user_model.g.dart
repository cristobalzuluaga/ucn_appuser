// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      username: json['username'] as String,
      email: json['email'] as String,
      age: json['age'] as String,
      interest: json['interest'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'age': instance.age,
      'interest': instance.interest,
    };
