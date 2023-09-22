import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos_search/dio/model/common/issue_and_pr_state.dart';
import 'package:github_repos_search/dio/model/issues/github_issues_response.dart';
import 'package:github_repos_search/dio/model/pull_request/github_pull_request_response.dart';
import 'package:github_repos_search/dio/model/repo/github_repo.dart';
import 'package:github_repos_search/dio/model/repo/github_repo_owner.dart';
import 'package:enum_to_string/enum_to_string.dart';

void main() {
  const id = 1;
  const name = "John";
  const fullName = "example_repo";
  const description = "desc";
  const private = true;
  const login = "johnLogin";
  const avatarUrl = "www.exampleurl.com";
  const pullsUrl = "www.pulUrl.com";
  const issuesUrl = "www.issuesUrl.com";
  const title = "exampleTitle";
  const createdAt = "22.09.2023";
  const body = "exampleBody";
  const mergedAt = "22.09.2023";
  const closedAt = "22.09.2023";
  const manuallyCreatedState = IssueAndPrState.open;
  final state = EnumToString.convertToString(manuallyCreatedState);
  Map<String, dynamic> exampleOwnerJson = {
    "login": login,
    "avatar_url": avatarUrl,
  };
  Map<String, dynamic> exampleGithubRepoAsJson = {
    "id": id,
    "name": name,
    "full_name": fullName,
    "description": description,
    "private": private,
    "owner": exampleOwnerJson,
    "pulls_url": pullsUrl,
    "issues_url": issuesUrl
  };
  Map<String, dynamic> exampleIssueJson = {
    "id": id,
    "title": title,
    "user": exampleOwnerJson,
    "body": body,
    "created_at": createdAt,
    "state": state
  };
  Map<String, dynamic> examplePrJson = {
    "id": id,
    "state": state,
    "user": exampleOwnerJson,
    "title": title,
    "body": body,
    "created_at": createdAt,
    "merged_at": mergedAt,
    "closed_at": closedAt,
  };
  final manuallyCreatedOwnerObject = GithubRepoOwner(
    login: login,
    avatarUrl: avatarUrl,
  );
  final manuallyCreatedGithubRepoObject = GithubRepo(
      id: id,
      name: name,
      fullName: fullName,
      private: private,
      owner: manuallyCreatedOwnerObject,
      pullRequests: pullsUrl,
      issuesUrl: issuesUrl,
      description: description);
  final manuallyCreatedIssueObject = GithubIssuesResponse(
    id: id,
    title: title,
    user: manuallyCreatedOwnerObject,
    createdAt: createdAt,
    state: manuallyCreatedState,
    body: body,
  );
  final manuallyCreatedPrObject = GithubPullRequestResponse(
    id: id,
    state: manuallyCreatedState,
    user: manuallyCreatedOwnerObject,
    body: body,
    createdAt: createdAt,
    mergedAt: mergedAt,
    closedAt: closedAt
  );
  group("Conversion json to objects", () {
    test('Convert json to githubRepo object should have equal values', () {
      final convertedObject = GithubRepo.fromJson(exampleGithubRepoAsJson);
      final allFieldsAreEqual = convertedObject.id ==
              manuallyCreatedGithubRepoObject.id &&
          convertedObject.name == manuallyCreatedGithubRepoObject.name &&
          convertedObject.fullName ==
              manuallyCreatedGithubRepoObject.fullName &&
          convertedObject.private == manuallyCreatedGithubRepoObject.private &&
          convertedObject.owner.login ==
              manuallyCreatedGithubRepoObject.owner.login &&
          convertedObject.owner.avatarUrl ==
              manuallyCreatedGithubRepoObject.owner.avatarUrl &&
          convertedObject.pullRequests ==
              manuallyCreatedGithubRepoObject.pullRequests &&
          convertedObject.issuesUrl ==
              manuallyCreatedGithubRepoObject.issuesUrl;
      expect(allFieldsAreEqual, true);
    });
    test('Convert json to issue object should have equal values', () {
      final convertedObject = GithubIssuesResponse.fromJson(exampleIssueJson);
      final allFieldsAreEqual =
          convertedObject.id == manuallyCreatedIssueObject.id &&
          convertedObject.title == manuallyCreatedIssueObject.title &&
          convertedObject.state == manuallyCreatedIssueObject.state &&
          convertedObject.user.login == manuallyCreatedIssueObject.user.login &&
          convertedObject.user.avatarUrl == manuallyCreatedIssueObject.user.avatarUrl &&
          convertedObject.body == manuallyCreatedIssueObject.body &&
          convertedObject.createdAt == manuallyCreatedIssueObject.createdAt;
      expect(allFieldsAreEqual, true);
    });
    test('Convert json to pull request object should have equal values', () {
      final convertedObject = GithubPullRequestResponse.fromJson(examplePrJson);
      final allFieldsAreEqual =
          convertedObject.id == manuallyCreatedPrObject.id &&
              convertedObject.state == manuallyCreatedPrObject.state &&
              convertedObject.user.login == manuallyCreatedPrObject.user.login &&
              convertedObject.user.avatarUrl == manuallyCreatedPrObject.user.avatarUrl &&
              convertedObject.body == manuallyCreatedPrObject.body &&
              convertedObject.createdAt == manuallyCreatedPrObject.createdAt &&
              convertedObject.mergedAt == manuallyCreatedPrObject.mergedAt &&
              convertedObject.closedAt == manuallyCreatedPrObject.closedAt;
      expect(allFieldsAreEqual, true);
    });
  });
}
