import 'package:dio/dio.dart';
import 'package:github_repos_search/dio/model/issues/github_issues_response.dart';
import 'package:github_repos_search/dio/model/pull_request/github_pull_request_response.dart';
import 'package:github_repos_search/dio/model/repo/github_response.dart';

class DioClient {
  final _baseUrl = "https://api.github.com";
  final _partialUrlToRemove = "{/number}";

  final Dio _dio = Dio();

  Future<GithubResponse> getRepos({String? query}) async {
    Response response =
        await _dio.get("$_baseUrl/search/repositories?q=$query");

    return GithubResponse.fromJson(response.data);
  }

  Future<List<GithubIssuesResponse>> getIssues(String url) async {
    final fixedUrl = url.replaceAll(RegExp(_partialUrlToRemove), "");
    Response response = await _dio.get(fixedUrl);
    return (response.data as List).map((e) => GithubIssuesResponse.fromJson(e)).toList();
  }

  Future<List<GithubPullRequestResponse>> getPullRequests(String url) async {
    final fixedUrl = url.replaceAll(RegExp(_partialUrlToRemove), "");
    Response response = await _dio.get(fixedUrl);
    return (response.data as List).map((e) => GithubPullRequestResponse.fromJson(e)).toList();
  }
}
