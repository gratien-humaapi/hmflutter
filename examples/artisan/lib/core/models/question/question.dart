import 'package:json_annotation/json_annotation.dart';


part 'question.g.dart';

@JsonSerializable()
class Question {
  final String customerTitle;
  final String contractorTitle;
  final String customerSubTitle;
  final String contractorSubTitle;
  final String type;
  final String imageLink;
  final List<dynamic> value;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Question({
    required this.type,
    required this.customerTitle,
    required this.contractorTitle,
    required this.customerSubTitle,
    required this.contractorSubTitle,
    required this.imageLink,
    required this.value,
  });

  Map<String, dynamic> toJson() => _$QuestionToJson(this);
}
