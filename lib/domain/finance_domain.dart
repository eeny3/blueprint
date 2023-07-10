import 'package:one_trade/resources/strings/common_strings.dart';

/// Доменная модель финансовых операций пользователя
class FinanceDomain {
  int? id;
  int? login;
  int? type;
  int? system;
  String amount;
  int? state;
  String adminComment;
  DateTime? created;
  DateTime? updated;

  FinanceDomain({
    this.id,
    this.login,
    this.type,
    this.system,
    this.state,
    this.created,
    this.updated,
    String? amount,
    String? adminComment,
  })  : amount = amount ?? emptyString,
        adminComment = adminComment ?? '';
}
