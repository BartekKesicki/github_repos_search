import 'package:github_repos_search/dio/model/repo/github_repo.dart';

abstract class GithubListState {}

class PerformToInitState extends GithubListState {}

class InitState extends GithubListState {
  final List<GithubRepo> items;

  InitState(this.items);
}

class ErrorState extends GithubListState {}