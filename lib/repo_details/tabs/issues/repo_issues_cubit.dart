import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_search/repo_details/tabs/issues/repo_issues_state.dart';
import 'package:github_repos_search/repository/github_repo_repository.dart';


class RepoIssuesCubit extends Cubit<RepoIssuesState> {
  RepoIssuesCubit(this._repoRepository) : super(PerformInitIssuesState());

  final GithubRepoRepository _repoRepository;

  Future<void> loadIssues(String url) async {
    try {
      final result = await _repoRepository.getIssues(url);
      emit(InitIssuesState(result));
    } catch(ex) {
      print(ex);
      emit(ErrorState());
    }
  }

}
