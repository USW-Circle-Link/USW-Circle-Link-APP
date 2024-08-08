import 'package:freezed_annotation/freezed_annotation.dart';

part 'ApplicationModel.freezed.dart';
part 'ApplicationModel.g.dart';

abstract class ApplicationModelBase {}

@freezed
class ApplicationModel extends ApplicationModelBase with _$ApplicationModel {

  factory ApplicationModel({
    String? data,
    String? message,
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) => _$ApplicationModelFromJson(json);
}

class ApplicationModelLoading extends ApplicationModelBase {}

class ApplicationModelError extends ApplicationModelBase {}