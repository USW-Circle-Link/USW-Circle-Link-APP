import 'package:freezed_annotation/freezed_annotation.dart';

part 'ApplicationModel.freezed.dart';
part 'ApplicationModel.g.dart';

enum ApplicationModelType {getApplication, apply}

abstract class ApplicationModelBase {}

@freezed
class ApplicationModel extends ApplicationModelBase with _$ApplicationModel {

  ApplicationModel._();

  factory ApplicationModel({
    required String message,
    String? data,
    ApplicationModelType? type,
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) => _$ApplicationModelFromJson(json);

   ApplicationModel setType(ApplicationModelType _type) {
    return ApplicationModel(message: message, type: _type, data: data);
  }
}

@freezed
class ApplicationModelError extends ApplicationModelBase with _$ApplicationModelError {

  ApplicationModelError._();

  factory ApplicationModelError({
    required String message,
    ApplicationModelType? type,
  }) = _ApplicationModelError;

  factory ApplicationModelError.fromJson(Map<String, dynamic> json) => _$ApplicationModelErrorFromJson(json);

  ApplicationModelError setType(ApplicationModelType _type) {
    return ApplicationModelError(message: message, type: _type);
  }
}

class ApplicationModelLoading extends ApplicationModelBase {}