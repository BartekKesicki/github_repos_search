// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubResponse _$GithubResponseFromJson(Map<String, dynamic> json) =>
    GithubResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => GithubRepo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GithubResponseToJson(GithubResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
