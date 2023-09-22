import 'package:github_repos_search/dio/model/repo/github_repo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_response.g.dart';

@JsonSerializable()
class GithubResponse {

  @JsonKey(name: "items")
  final List<GithubRepo> items;

  GithubResponse({required this.items});

  factory GithubResponse.fromJson(Map<String, dynamic> json) =>
      _$GithubResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GithubResponseToJson(this);
}