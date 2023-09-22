import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_search/arguments/repo_details_screen_argument.dart';
import 'package:github_repos_search/dio/model/repo/github_repo.dart';
import 'package:github_repos_search/github_list/github_list_cubit.dart';
import 'package:github_repos_search/github_list/github_list_state.dart';
import 'package:github_repos_search/repo_details/repo_details_screen.dart';
import 'package:github_repos_search/repository/github_repo_repository.dart';
import 'package:github_repos_search/widgets/item_owner_widget.dart';
import 'package:github_repos_search/widgets/item_title_widget.dart';
import 'package:github_repos_search/widgets/items_divider.dart';
import 'package:github_repos_search/widgets/load_list_error_widget.dart';
import 'package:github_repos_search/widgets/loading_widget.dart';

class GitHubListScreen extends StatefulWidget {
  const GitHubListScreen({super.key});

  @override
  State<StatefulWidget> createState() => _GitHubListScreenState();
}

class _GitHubListScreenState extends State<GitHubListScreen> {
  GithubListCubit? _cubit;
  TextEditingController? _controller;

  @override
  void initState() {
    super.initState();
    _cubit = GithubListCubit(context.read<GithubRepoRepository>());
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "GitHub List Demo",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<GithubListCubit, GithubListState>(
        bloc: _cubit,
        builder: (BuildContext context, GithubListState state) {
          if (state is PerformToInitState) {
            _cubit?.loadReposData();
            return _buildLoadingProcessIndicator();
          } else if (state is InitState) {
            return _buildReposListPage(state.items);
          } else if (state is ErrorState) {
            return LoadListErrorWidget(onTap: () => _cubit?.loadReposData());
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildReposListPage(List<GithubRepo> repos) {
    return Column(
      children: [
        _buildSearchTextField(),
        _buildReposList(repos),
      ],
    );
  }

  Widget _buildLoadingProcessIndicator() {
    return Column(
      children: [
        _buildSearchTextField(),
        const LoadingWidget(),
      ],
    );
  }

  Widget _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: SearchBar(
        hintText: "Search",
        controller: _controller,
        onChanged: (value) => _cubit?.loadReposData(phrase: value),
        backgroundColor: MaterialStateProperty.all(Colors.white54),
      ),
    );
  }

  Widget _buildReposList(List<GithubRepo> repos) {
    return Expanded(
      child: ListView.builder(
        itemCount: repos.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildListItem(repos[index], index);
        },
      ),
    );
  }

  Widget _buildListItem(GithubRepo repo, int index) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            RepoDetailsScreen.routeName,
            arguments: RepoDetailsScreenArgument(
                issuesUrl: repo.issuesUrl ?? "",
                pullRequestsUrl: repo.pullRequests ?? ""),
          );
        },
        splashColor: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemOwnerWidget(
              avatarUrl: repo.owner.avatarUrl,
              owner: repo.owner.login,
            ),
            _buildSpacer(5),
            ItemTitleWidget(
              title: repo.fullName,
            ),
            _buildSpacer(20),
            _buildDescriptionSection(repo.description ?? ""),
            const ItemsDivider(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpacer(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _buildDescriptionSection(String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Text(
        description,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _cubit?.close();
    _controller?.dispose();
  }
}
