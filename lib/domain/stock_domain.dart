import 'package:one_trade/domain/locale_text_domain.dart';
import 'package:one_trade/resources/strings/common_strings.dart';

/// Доменная модель для данных ipo
class StockDomain {
  int? id;
  int? category;
  String title;
  String ticker;
  String tickerTradingView;
  String logo;
  String website;
  String potential;
  String dividends;
  String tradingUrl;
  DateTime? ipoDate;
  DateTime? timerDateIpo;
  String transactionClosingDate;
  num? accommodationPrice;
  num? priceAfterOpeningIpo;
  num? transactionClosingPrice;
  num? marketCapitalization;
  int? assessedValue;
  int? foundationCompany;
  String investors;
  String lockUp;
  num? profitabilityPercentage;
  String transactionOpenDate;
  num? transactionOpenPrice;
  bool isNew;
  bool hit;
  int? volumeMin;
  Map<String, LocaleTextDomain> descriptions;
  String logoUri;
  String shortDescription;
  String longDescription;
  List<String> languages;

  StockDomain({
    this.id,
    this.category,
    this.ipoDate,
    this.timerDateIpo,
    this.accommodationPrice,
    this.priceAfterOpeningIpo,
    this.transactionClosingPrice,
    this.marketCapitalization,
    this.assessedValue,
    this.foundationCompany,
    this.profitabilityPercentage,
    this.transactionOpenPrice,
    this.volumeMin,
    String? transactionClosingDate,
    String? investors,
    String? lockUp,
    String? transactionOpenDate,
    String? logoUri,
    String? shortDescription,
    String? longDescription,
    String? title,
    String? ticker,
    String? tickerTradingView,
    String? logo,
    String? website,
    String? potential,
    String? dividends,
    String? tradingUrl,
    bool? isNew,
    bool? hit,
    Map<String, LocaleTextDomain>? descriptions,
    List<String>? languages,
  })  : isNew = isNew ?? false,
        hit = hit ?? false,
        descriptions = descriptions ?? {},
        transactionClosingDate = transactionClosingDate ?? emptyString,
        investors = investors ?? emptyString,
        lockUp = lockUp ?? emptyString,
        transactionOpenDate = transactionOpenDate ?? emptyString,
        logoUri = logoUri ?? emptyString,
        shortDescription = shortDescription ?? emptyString,
        longDescription = longDescription ?? emptyString,
        title = title ?? emptyString,
        ticker = ticker ?? emptyString,
        tickerTradingView = tickerTradingView ?? emptyString,
        logo = logo ?? emptyString,
        website = website ?? emptyString,
        potential = potential ?? emptyString,
        dividends = dividends ?? emptyString,
        tradingUrl = tradingUrl ?? emptyString,
        languages = languages ?? [];
}
