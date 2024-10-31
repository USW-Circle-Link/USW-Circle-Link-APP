import 'package:freezed_annotation/freezed_annotation.dart';

part 'application_model.freezed.dart';
part 'application_model.g.dart';

enum ApplicationModelType {getApplication, apply, checkAvailableForApplication}

@freezed
class ApplicationModel with _$ApplicationModel {

  ApplicationModel._();

  factory ApplicationModel({
    required String message,
    String? data,
    ApplicationModelType? type,
  }) = _ApplicationModel;

  factory ApplicationModel.fromJson(Map<String, dynamic> json) => _$ApplicationModelFromJson(json);

   ApplicationModel setType(ApplicationModelType type) {
    return ApplicationModel(message: message, type: type, data: data);
  }
}

@freezed
class ApplicationModelError with _$ApplicationModelError implements Error {

  ApplicationModelError._();

  factory ApplicationModelError({
    required String message,
    ApplicationModelType? type,
  }) = _ApplicationModelError;

  factory ApplicationModelError.fromJson(Map<String, dynamic> json) => _$ApplicationModelErrorFromJson(json);

  ApplicationModelError setType(ApplicationModelType type) {
    return ApplicationModelError(message: message, type: type);
  }
  
  @override
  StackTrace get stackTrace => StackTrace.fromString(toString());
}