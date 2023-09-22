import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_search/github_list/github_list_state.dart';
import 'package:github_repos_search/repository/github_repo_repository.dart';

class GithubListCubit extends Cubit<GithubListState> {

  GithubListCubit(this.repoRepository) : super(PerformToInitState());

  final GithubRepoRepository repoRepository;


  Future<void> loadReposData({String? phrase}) async {
    try {
      final result = await repoRepository.getRepos(query: phrase);
      emit(InitState(result.items));
    } catch(ex) {
      emit(ErrorState());
    }
  }

}