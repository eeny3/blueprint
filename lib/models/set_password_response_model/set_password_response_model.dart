import 'package:json_annotation/json_annotation.dart';

part 'set_password_response_model.g.dart';

/// Модель для тела запроса третьего шага регистрации
@JsonSerializable()
class SetPasswordResponseModel {
  /// Token
  @JsonKey()
  final String token;

  SetPasswordResponseModel({
    required this.token,
  });

  factory SetPasswordResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SetPasswordResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SetPasswordResponseModelToJson(this);
  }
}