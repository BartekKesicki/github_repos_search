import 'package:flutter/material.dart';
import 'package:github_repos_search/arguments/repo_details_screen_argument.dart';
import 'package:github_repos_search/dio/dio_client.dart';
import 'package:github_repos_search/github_list/github_list_cubit.dart';
import 'package:github_repos_search/github_list/github_list_screen.dart';
import 'package:github_repos_search/repo_details/repo_details_screen.dart';
import 'package:github_repos_search/repo_details/tabs/issues/repo_issues_cubit.dart';
import 'package:github_repos_search/repo_details/tabs/pull_requests/repo_pr_cubit.dart';
import 'package:github_repos_search/repository/github_repo_repository.dart';
import 'package:github_repos_search/utils/issue_and_pr_state_color_manager.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => DioClient(),
        ),
        Provider(
          create: (context) => GithubRepoRepository(
            context.read<DioClient>(),
          ),
        ),
        Provider(
          create: (context) => IssueAndPrStateColorManager(),
        ),
      ],
      child: MaterialApp(
        title: 'Github search demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const GitHubListScreen(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case RepoDetailsScreen.routeName:
              final arguments = settings.arguments as RepoDetailsScreenArgument;
              return _createPageRouteBuilder(
                RepoDetailsScreen(
                  issuesUrl: arguments.issuesUrl,
                  pullRequestUrl: arguments.pullRequestsUrl,
                ),
                settings,
              );
            default:
              return _createPageRouteBuilder(
                const GitHubListScreen(),
                settings,
              );
          }
        },
        initialRoute: '/',
      ),
    );
  }

  PageRouteBuilder _createPageRouteBuilder(
    Widget widget,
    RouteSettings settings,
  ) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (_, __, ___) => widget,
      transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
    );
  }
}
