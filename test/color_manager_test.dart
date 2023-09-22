
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repos_search/dio/model/common/issue_and_pr_state.dart';
import 'package:github_repos_search/utils/issue_and_pr_state_color_manager.dart';

void main() {
  final colorManager = IssueAndPrStateColorManager();
  group("Coloured labels", () {
    test('Color open text should be green', () {
      const openState = IssueAndPrState.open;

      final color = colorManager.adjustColorAccordingToState(openState);

      expect(color, Colors.green);
    });
    test('Color closed text should be red', () {
      const closedState = IssueAndPrState.closed;

      final color = colorManager.adjustColorAccordingToState(closedState);

      expect(color, Colors.red);
    });
    test('Color all text should be black', () {
      const allState = IssueAndPrState.all;

      final color = colorManager.adjustColorAccordingToState(allState);

      expect(color, Colors.black);
    });
  });

}