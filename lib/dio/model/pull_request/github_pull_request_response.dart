import 'package:github_repos_search/dio/model/common/issue_and_pr_state.dart';
import 'package:github_repos_search/dio/model/repo/github_repo_owner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_pull_request_response.g.dart';

@JsonSerializable()
class GithubPullRequestResponse {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "state")
  final IssueAndPrState state;
  @JsonKey(name: "user")
  final GithubRepoOwner user;
  @JsonKey(name: "body")
  final String? body;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "merged_at")
  final String? mergedAt;
  @JsonKey(name: "closed_at")
  final String? closedAt;

  GithubPullRequestResponse({
    required this.id,
    required this.state,
    required this.user,
    this.body,
    this.createdAt,
    this.mergedAt,
    this.closedAt,
  });

  factory GithubPullRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$GithubPullRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GithubPullRequestResponseToJson(this);
}
