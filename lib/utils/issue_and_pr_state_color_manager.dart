import 'package:flutter/material.dart';
import 'package:github_repos_search/dio/model/common/issue_and_pr_state.dart';

class IssueAndPrStateColorManager {

  Color adjustColorAccordingToState(IssueAndPrState state) {
    switch(state) {
      case IssueAndPrState.open:
        return Colors.green;
      case IssueAndPrState.closed:
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}