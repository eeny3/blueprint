import 'package:one_trade/domain/stock_domain.dart';

/// Доменная модель для списков прошедших и нынишних ipo
class LastPastActualDomain {
  List<StockDomain> otc;
  List<StockDomain> ipoPast;
  List<StockDomain> ipoCurrent;

  LastPastActualDomain({
    List<StockDomain>? otc,
    List<StockDomain>? ipoPast,
    List<StockDomain>? ipoCurrent,
  })  : otc = otc ?? [],
        ipoPast = ipoPast ?? [],
        ipoCurrent = ipoCurrent ?? [];
}
