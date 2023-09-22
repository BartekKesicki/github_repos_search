import 'package:github_repos_search/dio/model/issues/github_issues_response.dart';

abstract class RepoIssuesState {}

class PerformInitIssuesState extends RepoIssuesState {}

class InitIssuesState extends RepoIssuesState {
  final List<GithubIssuesResponse> items;

  InitIssuesState(this.items);
}

class ErrorState extends RepoIssuesState {}