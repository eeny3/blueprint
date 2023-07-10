import 'package:elementary/elementary.dart';
import 'package:one_trade/domain/stock_domain.dart';
import 'package:one_trade/interactors/stock/stock_interactor.dart';

/// Elementary model для страницы ipo
class PortfolioIpoViewModel extends ElementaryModel {
  final StockInteractor _stockInteractor;

  PortfolioIpoViewModel(
    ErrorHandler errorHandler,
    this._stockInteractor,
  ) : super(errorHandler: errorHandler);

  /// Получение списков pre-ipo
  Future<List<StockDomain>?> getPreIpoStockList() =>
      _stockInteractor.getPreIpoStockList();
}
