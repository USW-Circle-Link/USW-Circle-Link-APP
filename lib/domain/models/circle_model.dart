import 'package:json_annotation/json_annotation.dart';

part 'circle_model.g.dart';

abstract class CircleModelBase {}

class CircleModelError extends CircleModelBase {
  final String message;
  CircleModelError({required this.message});
}

@JsonSerializable()
class CircleModel extends CircleModelBase {
  final String uuid;
  final String name;
  final String mainImage;
  final String introduction;
  final List<String> tags;

  CircleModel({
    required this.uuid,
    required this.name,
    required this.mainImage,
    required this.introduction,
    required this.tags,
  });

  factory CircleModel.fromJson(Map<String, dynamic> json) =>
      _$CircleModelFromJson(json);
}
