import 'package:github_repos_search/dio/model/repo/github_repo_owner.dart';
import 'package:github_repos_search/dio/model/common/issue_and_pr_state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_issues_response.g.dart';

@JsonSerializable()
class GithubIssuesResponse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "user")
  final GithubRepoOwner user;
  @JsonKey(name: "created_at")
  final String createdAt;
  @JsonKey(name: "state")
  final IssueAndPrState state;
  @JsonKey(name: "body")
  final String? body;

  GithubIssuesResponse({
    required this.id,
    required this.title,
    required this.user,
    required this.createdAt,
    required this.state,
    this.body,
  });

  factory GithubIssuesResponse.fromJson(Map<String, dynamic> json) =>
      _$GithubIssuesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GithubIssuesResponseToJson(this);
}
