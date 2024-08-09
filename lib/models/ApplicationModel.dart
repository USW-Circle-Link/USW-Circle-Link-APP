import 'package:freezed_annotation/freezed_annotation.dart';

part 'ApplicationModel.freezed.dart';
part 'ApplicationModel.g.dart';

abstract class ApplicationModelBase {}

@freezed
class ApplicationModel extends ApplicationModelBase with _$ApplicationModel {

  factory ApplicationModel({
    required String data,
    required String message,
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) => _$ApplicationModelFromJson(json);
}

class ApplicationModelLoading extends ApplicationModelBase {}

@freezed
class ApplicationModelComplete extends ApplicationModelBase with _$ApplicationModelComplete {

  factory ApplicationModelComplete({
    required String message,
  }) = _ApplicationModelComplete;

  factory ApplicationModelComplete.fromJson(Map<String, dynamic> json) => _$ApplicationModelCompleteFromJson(json);
}

class ApplicationModelError extends ApplicationModelBase {}