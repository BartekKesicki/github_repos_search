// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_owner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepoOwner _$GithubRepoOwnerFromJson(Map<String, dynamic> json) =>
    GithubRepoOwner(
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$GithubRepoOwnerToJson(GithubRepoOwner instance) =>
    <String, dynamic>{
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };
