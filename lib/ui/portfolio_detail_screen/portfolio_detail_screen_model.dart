import 'package:elementary/elementary.dart';
import 'package:one_trade/domain/account_domain.dart';

/// Elementary model для страницы информации счета пользователя
class PortfolioDetailScreenModel extends ElementaryModel {
  final AccountDomain account;

  PortfolioDetailScreenModel(
    ErrorHandler errorHandler,
    this.account,
  ) : super(errorHandler: errorHandler);
}
