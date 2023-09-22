// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepo _$GithubRepoFromJson(Map<String, dynamic> json) => GithubRepo(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      description: json['description'] as String?,
      private: json['private'] as bool,
      owner: GithubRepoOwner.fromJson(json['owner'] as Map<String, dynamic>),
      pullRequests: json['pulls_url'] as String?,
      issuesUrl: json['issues_url'] as String?,
    );

Map<String, dynamic> _$GithubRepoToJson(GithubRepo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'full_name': instance.fullName,
      'description': instance.description,
      'private': instance.private,
      'owner': instance.owner,
      'pulls_url': instance.pullRequests,
      'issues_url': instance.issuesUrl,
    };
