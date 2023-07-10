import 'package:one_trade/models/locale_text/locale_text_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock_response_model.g.dart';

/// Модель ответа запроса для данных ipo
@JsonSerializable()
class StockResponseModel {
  int? id;
  int? category;
  String? title;
  String? ticker;
  String? tickerTradingview;
  String? logo;
  String? website;
  String? potential;
  String? dividends;
  String? tradingUrl;
  DateTime? ipoDate;
  DateTime? timerDateIpo;
  String? transactionClosingDate;
  num? accommodationPrice;
  num? priceAfterOpeningIpo;
  num? transactionClosingPrice;
  num? marketCapitalization;
  int? assessedValue;
  int? foundationCompany;
  String? investors;
  String? lockUp;
  num? profitabilityPercentage;
  String? transactionOpenDate;
  num? transactionOpenPrice;
  bool? isNew;
  bool? hit;
  int? volumeMin;
  Map<String, LocaleTextResponseModel>? descriptions;
  String? logoUri;
  String? shortDescription;
  String? longDescription;
  List<String>? languages;

  StockResponseModel({
    this.id,
    this.category,
    this.title,
    this.ticker,
    this.tickerTradingview,
    this.logo,
    this.website,
    this.potential,
    this.dividends,
    this.tradingUrl,
    this.ipoDate,
    this.timerDateIpo,
    this.transactionClosingDate,
    this.accommodationPrice,
    this.priceAfterOpeningIpo,
    this.transactionClosingPrice,
    this.marketCapitalization,
    this.assessedValue,
    this.foundationCompany,
    this.investors,
    this.lockUp,
    this.profitabilityPercentage,
    this.transactionOpenDate,
    this.transactionOpenPrice,
    this.isNew,
    this.hit,
    this.volumeMin,
    this.descriptions,
    this.logoUri,
    this.shortDescription,
    this.longDescription,
    this.languages,
  });

  factory StockResponseModel.fromJson(Map<String, dynamic> json) {
    return _$StockResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$StockResponseModelToJson(this);
  }
}
