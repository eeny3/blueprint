import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_account_detail_view/closed/portfolio_detail_account_details_model.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_account_detail_view/closed/portfolio_detail_account_details_view.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IPortfolioDetailAccountDetailsViewWidgetModel extends IWidgetModel {

}

PortfolioDetailAccountDetailsViewWidgetModel defaultPortfolioDetailAccountDetailsViewWidgetModelFactory(
    BuildContext context) {
  return PortfolioDetailAccountDetailsViewWidgetModel(
      PortfolioDetailAccountDetailsViewModel(standardErrorHandler));
}

/// Elementary widget model для страницы информации счета пользователя
class PortfolioDetailAccountDetailsViewWidgetModel
    extends WidgetModel<PortfolioDetailAccountDetailsView, PortfolioDetailAccountDetailsViewModel>
    implements IPortfolioDetailAccountDetailsViewWidgetModel {
  PortfolioDetailAccountDetailsViewWidgetModel(PortfolioDetailAccountDetailsViewModel model) : super(model);

}
