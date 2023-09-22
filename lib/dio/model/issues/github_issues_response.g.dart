// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_issues_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubIssuesResponse _$GithubIssuesResponseFromJson(
        Map<String, dynamic> json) =>
    GithubIssuesResponse(
      id: json['id'] as int,
      title: json['title'] as String,
      user: GithubRepoOwner.fromJson(json['user'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
      state: $enumDecode(_$IssueAndPrStateEnumMap, json['state']),
      body: json['body'] as String?,
    );

Map<String, dynamic> _$GithubIssuesResponseToJson(
        GithubIssuesResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'user': instance.user,
      'created_at': instance.createdAt,
      'state': _$IssueAndPrStateEnumMap[instance.state]!,
      'body': instance.body,
    };

const _$IssueAndPrStateEnumMap = {
  IssueAndPrState.open: 'open',
  IssueAndPrState.closed: 'closed',
  IssueAndPrState.all: 'all',
};
