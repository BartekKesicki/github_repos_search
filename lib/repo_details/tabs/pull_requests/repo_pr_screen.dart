import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_search/dio/model/common/issue_and_pr_state.dart';
import 'package:github_repos_search/dio/model/pull_request/github_pull_request_response.dart';
import 'package:github_repos_search/repo_details/tabs/pull_requests/repo_pr_cubit.dart';
import 'package:github_repos_search/repo_details/tabs/pull_requests/repo_pr_state.dart';
import 'package:github_repos_search/repository/github_repo_repository.dart';
import 'package:github_repos_search/widgets/item_owner_widget.dart';
import 'package:github_repos_search/widgets/items_divider.dart';
import 'package:github_repos_search/widgets/load_list_error_widget.dart';
import 'package:github_repos_search/widgets/loading_widget.dart';
import 'package:github_repos_search/widgets/state_widget.dart';

class RepoPrScreen extends StatefulWidget {
  const RepoPrScreen({super.key, required this.url});

  final String url;

  @override
  State<StatefulWidget> createState() => _RepoPrScreenState();
}

class _RepoPrScreenState extends State<RepoPrScreen> {
  RepoPrCubit? _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = RepoPrCubit(context.read<GithubRepoRepository>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RepoPrCubit, RepoPrState>(
        bloc: _cubit,
        builder: (BuildContext context, RepoPrState state) {
          if (state is PerformRepoPrState) {
            _cubit?.loadPullRequests(widget.url);
            return const LoadingWidget();
          } else if (state is InitRepoPrState) {
            return _buildPullRequestsList(state.items);
          } else if (state is ErrorState) {
            return LoadListErrorWidget(
              onTap: () => _cubit?.loadPullRequests(widget.url),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildPullRequestsList(List<GithubPullRequestResponse> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        if (item.state == IssueAndPrState.open) {
          return _buildPrListItem(item);
        }
        return Container();
      },
    );
  }

  Widget _buildPrListItem(GithubPullRequestResponse item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemOwnerWidget(
          avatarUrl: item.user.avatarUrl,
          owner: item.user.login,
        ),
        _buildSpacer(5),
        StateWidget(state: item.state),
        _buildSpacer(10),
        _buildBodySection(item.body),
        const ItemsDivider(),
      ],
    );
  }

  Widget _buildSpacer(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget _buildBodySection(String? body) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      child: Text(
        body ?? "",
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
        style: const TextStyle(
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _cubit?.close();
  }
}
