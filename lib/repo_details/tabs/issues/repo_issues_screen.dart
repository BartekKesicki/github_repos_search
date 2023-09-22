import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:github_repos_search/dio/model/issues/github_issues_response.dart';
import 'package:github_repos_search/dio/model/common/issue_and_pr_state.dart';
import 'package:github_repos_search/repo_details/tabs/issues/repo_issues_cubit.dart';
import 'package:github_repos_search/repo_details/tabs/issues/repo_issues_state.dart';
import 'package:github_repos_search/repository/github_repo_repository.dart';
import 'package:github_repos_search/utils/issue_and_pr_state_color_manager.dart';
import 'package:github_repos_search/widgets/item_owner_widget.dart';
import 'package:github_repos_search/widgets/item_title_widget.dart';
import 'package:github_repos_search/widgets/items_divider.dart';
import 'package:github_repos_search/widgets/load_list_error_widget.dart';
import 'package:github_repos_search/widgets/loading_widget.dart';
import 'package:github_repos_search/widgets/state_widget.dart';

class RepoIssuesScreen extends StatefulWidget {
  const RepoIssuesScreen({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<StatefulWidget> createState() => _RepoIssuesScreenState();
}

class _RepoIssuesScreenState extends State<RepoIssuesScreen> {
  RepoIssuesCubit? _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = RepoIssuesCubit(context.read<GithubRepoRepository>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RepoIssuesCubit, RepoIssuesState>(
        bloc: _cubit,
        builder: (BuildContext context, RepoIssuesState state) {
          if (state is PerformInitIssuesState) {
            _cubit?.loadIssues(widget.url);
            return const LoadingWidget();
          } else if (state is InitIssuesState) {
            return _buildIssuesList(state.items);
          } else if (state is ErrorState) {
            return LoadListErrorWidget(
              onTap: () => _cubit?.loadIssues(widget.url),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildIssuesList(List<GithubIssuesResponse> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        if (item.state == IssueAndPrState.open) {
          return _buildIssuesListItem(item);
        }
        return Container();
      },
    );
  }

  Widget _buildIssuesListItem(GithubIssuesResponse item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemTitleWidget(title: item.title),
        _buildSpacer(5),
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
        maxLines: 5,
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
