import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_invest_info_view/portfolio_invest_info_view.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_invest_info_view/portfolio_invest_info_view_model.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IPortfolioInvestInfoViewWidgetModel extends IWidgetModel {

}

PortfolioInvestInfoViewWidgetModel defaultPortfolioInvestInfoViewWidgetModelFactory(
    BuildContext context) {
  return PortfolioInvestInfoViewWidgetModel(
      PortfolioInvestInfoViewModel(standardErrorHandler));
}

/// Elementary widget model для страницы инвестиции
class PortfolioInvestInfoViewWidgetModel
    extends WidgetModel<PortfolioInvestInfoView, PortfolioInvestInfoViewModel>
    implements IPortfolioInvestInfoViewWidgetModel {
  PortfolioInvestInfoViewWidgetModel(PortfolioInvestInfoViewModel model) : super(model);

}
