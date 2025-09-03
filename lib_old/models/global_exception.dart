import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_exception.freezed.dart';

@freezed
class GlobalException with _$GlobalException {
  const factory GlobalException({
    String? message,
    String? code,
  }) = _GlobalException;
}
