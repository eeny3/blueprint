import 'package:intl/intl.dart';
import 'package:one_trade/resources/strings/common_strings.dart';

/// Доменная модель заказа пользователя
class OrderDomain {
  int? id;
  String symbol;
  Object? stock;
  double? volume;
  double? openPrice;
  Object? profit;
  DateTime? openTime;
  int? type;
  double? commissionOpen;
  double? price;
  double? currentPrice;
  double? currentPricePercent;
  double? increase;
  double? increasePercent;

  OrderDomain({
    this.id,
    this.stock,
    this.volume,
    this.openPrice,
    this.profit,
    this.openTime,
    this.type,
    this.commissionOpen,
    this.price,
    this.currentPrice,
    this.currentPricePercent,
    this.increase,
    this.increasePercent,
    String? symbol,
  }) : symbol = symbol ?? emptyString;

  String get increasePercentRounded => increasePercent.toString().split('.')[0];

  String get increasePercentRemainder {
    String remainder = increasePercent.toString().split('.')[1];
    return remainder.length > 1 ? remainder.substring(0, 2) : remainder;
  }

  String get increaseRounded => increase.toString().split('.')[0];

  String get increaseRemainder {
    String remainder = increase.toString().split('.')[1];
    return remainder.length > 1 ? remainder.substring(0, 2) : remainder;
  }

  String get priceRounded => price.toString().split('.')[0];

  String get priceRemainder {
    String remainder = price.toString().split('.')[1];
    return remainder.length > 1 ? remainder.substring(0, 2) : remainder;
  }

  String get openTimeFormatted => openTime != null
      ? DateFormat('dd/MM/yyyy hh:mm aa').format(openTime!)
      : '';
}
