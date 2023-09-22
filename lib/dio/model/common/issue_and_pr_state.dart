import 'package:json_annotation/json_annotation.dart';

enum IssueAndPrState {
  @JsonValue("open") open,
  @JsonValue("closed") closed,
  @JsonValue("all") all
}