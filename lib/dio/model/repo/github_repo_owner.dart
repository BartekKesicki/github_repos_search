import 'package:json_annotation/json_annotation.dart';

part 'github_repo_owner.g.dart';

@JsonSerializable()
class GithubRepoOwner {

  @JsonKey(name: "login")
  final String login;
  @JsonKey(name: "avatar_url")
  final String avatarUrl;

  GithubRepoOwner({required this.login, required this.avatarUrl});

  factory GithubRepoOwner.fromJson(Map<String, dynamic> json) =>
      _$GithubRepoOwnerFromJson(json);

  Map<String, dynamic> toJson() => _$GithubRepoOwnerToJson(this);
}