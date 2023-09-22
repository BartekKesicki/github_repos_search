// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_pull_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubPullRequestResponse _$GithubPullRequestResponseFromJson(
        Map<String, dynamic> json) =>
    GithubPullRequestResponse(
      id: json['id'] as int,
      state: $enumDecode(_$IssueAndPrStateEnumMap, json['state']),
      user: GithubRepoOwner.fromJson(json['user'] as Map<String, dynamic>),
      body: json['body'] as String?,
      createdAt: json['created_at'] as String?,
      mergedAt: json['merged_at'] as String?,
      closedAt: json['closed_at'] as String?,
    );

Map<String, dynamic> _$GithubPullRequestResponseToJson(
        GithubPullRequestResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'state': _$IssueAndPrStateEnumMap[instance.state]!,
      'user': instance.user,
      'body': instance.body,
      'created_at': instance.createdAt,
      'merged_at': instance.mergedAt,
      'closed_at': instance.closedAt,
    };

const _$IssueAndPrStateEnumMap = {
  IssueAndPrState.open: 'open',
  IssueAndPrState.closed: 'closed',
  IssueAndPrState.all: 'all',
};
