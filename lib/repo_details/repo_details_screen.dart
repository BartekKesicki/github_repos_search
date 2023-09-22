import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_repos_search/repo_details/tabs/issues/repo_issues_screen.dart';
import 'package:github_repos_search/repo_details/tabs/pull_requests/repo_pr_screen.dart';

class RepoDetailsScreen extends StatefulWidget {
  const RepoDetailsScreen({
    super.key,
    required this.issuesUrl,
    required this.pullRequestUrl,
  });
  static const String routeName = '/details';

  final String issuesUrl;
  final String pullRequestUrl;

  @override
  State<StatefulWidget> createState() => _RepoDetailsScreenState();
}

class _RepoDetailsScreenState extends State<RepoDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            bottom: const TabBar(
              tabs: [
                Text("ISSUES"),
                Text("PULL REQUESTS"),
              ],
            ),
            title: const Text('Repo details'),
          ),
          body: TabBarView(
            children: [
              RepoIssuesScreen(
                url: widget.issuesUrl,
              ),
              RepoPrScreen(
                url: widget.pullRequestUrl,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
