import 'package:github_repos_search/dio/model/common/issue_and_pr_state.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repos_search/utils/issue_and_pr_state_color_manager.dart';

class StateWidget extends StatefulWidget {
  const StateWidget({
    super.key,
    required this.state,
  });

  final IssueAndPrState state;

  @override
  State<StatefulWidget> createState() => _StateWidgetState();
}

class _StateWidgetState extends State<StateWidget> {
  IssueAndPrStateColorManager? _statusColorManager;

  @override
  void initState() {
    super.initState();
    _statusColorManager = context.read<IssueAndPrStateColorManager>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          const Text("STATUS: "),
          Text(
            EnumToString.convertToString(widget.state),
            style: TextStyle(
              color: _statusColorManager
                  ?.adjustColorAccordingToState(widget.state),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
