import 'package:github_repos_search/dio/model/pull_request/github_pull_request_response.dart';

abstract class RepoPrState {}

class PerformRepoPrState extends RepoPrState {}

class InitRepoPrState extends RepoPrState {
  final List<GithubPullRequestResponse> items;

  InitRepoPrState(this.items);
}

class ErrorState extends RepoPrState {}