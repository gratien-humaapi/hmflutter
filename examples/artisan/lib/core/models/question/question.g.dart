// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      type: json['type'] as String,
      customerTitle: json['customerTitle'] as String,
      contractorTitle: json['contractorTitle'] as String,
      customerSubTitle: json['customerSubTitle'] as String,
      contractorSubTitle: json['contractorSubTitle'] as String,
      imageLink: json['imageLink'] as String,
      value: json['value'] as List<dynamic>,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'customerTitle': instance.customerTitle,
      'contractorTitle': instance.contractorTitle,
      'customerSubTitle': instance.customerSubTitle,
      'contractorSubTitle': instance.contractorSubTitle,
      'type': instance.type,
      'imageLink': instance.imageLink,
      'value': instance.value,
    };
