import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_trade_info_view/portfolio_trade_info_view.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_trade_info_view/portfolio_trade_info_view_model.dart';
import 'package:one_trade/utils/inject.dart';

abstract class IPortfolioTradeInfoViewWidgetModel extends IWidgetModel {

}

PortfolioTradeInfoViewWidgetModel
    defaultPortfolioInvestInfoViewWidgetModelFactory(BuildContext context) {
  return PortfolioTradeInfoViewWidgetModel(
      PortfolioTradeInfoViewModel(standardErrorHandler));
}

/// Elementary widget model для страницы информации о торговле
class PortfolioTradeInfoViewWidgetModel
    extends WidgetModel<PortfolioTradeInfoView, PortfolioTradeInfoViewModel>
    implements IPortfolioTradeInfoViewWidgetModel {
  PortfolioTradeInfoViewWidgetModel(PortfolioTradeInfoViewModel model)
      : super(model);

}
