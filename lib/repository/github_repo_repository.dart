
import 'package:github_repos_search/dio/dio_client.dart';
import 'package:github_repos_search/dio/model/issues/github_issues_response.dart';
import 'package:github_repos_search/dio/model/pull_request/github_pull_request_response.dart';
import 'package:github_repos_search/dio/model/repo/github_response.dart';

class GithubRepoRepository {

  final DioClient dioClient;

  GithubRepoRepository(this.dioClient);

  Future<GithubResponse> getRepos({String? query}) async {
    return dioClient.getRepos(query: query);
  }

  Future<List<GithubIssuesResponse>> getIssues(String url) async {
    return dioClient.getIssues(url);
  }

  Future<List<GithubPullRequestResponse>> getPullRequests(String url) async {
    return dioClient.getPullRequests(url);
  }
}