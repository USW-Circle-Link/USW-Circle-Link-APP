import 'package:freezed_annotation/freezed_annotation.dart';

part 'circle_list_response.freezed.dart';
part 'circle_list_response.g.dart';

@freezed
class CircleListResponse with _$CircleListResponse {
  @JsonSerializable(explicitToJson: true)
  const factory CircleListResponse({
    @JsonKey(name: "message") required String message,
    @JsonKey(name: "data") required List<Club> clubs,
  }) = _CircleListResponse;

  factory CircleListResponse.fromJson(Map<String, dynamic> json) =>
      _$CircleListResponseFromJson(json);
}

@freezed
class Club with _$Club {
  const factory Club({
    @JsonKey(name: "clubUUID") required String clubUuid,
    @JsonKey(name: "clubName") required String clubName,
    @JsonKey(name: "mainPhoto") required String? mainPhoto,
  }) = _Club;

  factory Club.fromJson(Map<String, dynamic> json) => _$ClubFromJson(json);
}
