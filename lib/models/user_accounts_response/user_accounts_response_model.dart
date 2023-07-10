import 'package:json_annotation/json_annotation.dart';
import 'package:one_trade/models/account/account_response_model.dart';

part 'user_accounts_response_model.g.dart';

/// Модель ответа запроса списков счетов пользователя
@JsonSerializable()
class UserAccountsResponseModel {
  List<AccountResponseModel>? brokerList;
  List<AccountResponseModel>? investList;
  List<AccountResponseModel>? mt5List;

  UserAccountsResponseModel({this.brokerList, this.investList, this.mt5List});

  factory UserAccountsResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserAccountsResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserAccountsResponseModelToJson(this);
  }


}
