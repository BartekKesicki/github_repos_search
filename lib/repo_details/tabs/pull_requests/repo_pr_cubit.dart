
import 'package:bloc/bloc.dart';
import 'package:github_repos_search/repo_details/tabs/pull_requests/repo_pr_state.dart';
import 'package:github_repos_search/repository/github_repo_repository.dart';

class RepoPrCubit extends Cubit<RepoPrState> {
  RepoPrCubit(this._repoRepository) : super(PerformRepoPrState());

  final GithubRepoRepository _repoRepository;

  Future<void> loadPullRequests(String url) async {
    try {
      final pullRequests = await _repoRepository.getPullRequests(url);
      emit(InitRepoPrState(pullRequests));
    } catch(ex) {
      print(ex);
      emit(ErrorState());
    }
  }

}