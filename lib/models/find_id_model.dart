import 'package:freezed_annotation/freezed_annotation.dart';

part 'find_id_model.freezed.dart';
part 'find_id_model.g.dart';

@freezed
class FindIdModel with _$FindIdModel {
  FindIdModel._();

  factory FindIdModel({
    required String message,
  }) = _FindIdModel;

  factory FindIdModel.fromJson(Map<String, dynamic> json) =>
      _$FindIdModelFromJson(json);
}
