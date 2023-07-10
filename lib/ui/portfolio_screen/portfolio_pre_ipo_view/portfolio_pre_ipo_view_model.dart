import 'package:elementary/elementary.dart';
import 'package:one_trade/domain/stock_domain.dart';
import 'package:one_trade/interactors/stock/stock_interactor.dart';

/// Elementary model для страницы pre ipo
class PortfolioPreIpoViewModel extends ElementaryModel {
  final StockInteractor _stockInteractor;

  Future<List<StockDomain>?> getPreIpoStockList() =>
      _stockInteractor.getPreIpoStockList();

  PortfolioPreIpoViewModel(
    ErrorHandler errorHandler,
    this._stockInteractor,
  ) : super(errorHandler: errorHandler);
}
