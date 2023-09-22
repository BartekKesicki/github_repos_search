import 'package:github_repos_search/dio/model/repo/github_repo_owner.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_repo.g.dart';

@JsonSerializable()
class GithubRepo {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "private")
  final bool private;
  @JsonKey(name: "owner")
  final GithubRepoOwner owner;
  @JsonKey(name: "pulls_url")
  final String? pullRequests;
  @JsonKey(name: "issues_url")
  final String? issuesUrl;

  GithubRepo({
    required this.id,
    required this.name,
    required this.fullName,
    this.description,
    required this.private,
    required this.owner,
    this.pullRequests,
    this.issuesUrl,
  });

  factory GithubRepo.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoFromJson(json);

  Map<String, dynamic> toJson() => _$GithubRepoToJson(this);
}
