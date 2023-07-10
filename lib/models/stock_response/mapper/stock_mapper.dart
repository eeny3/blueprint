import 'package:one_trade/models/locale_text/mapper/locale_text_mapper.dart';
import 'package:one_trade/models/stock_response/stock_response_model.dart';
import 'package:one_trade/domain/stock_domain.dart';

StockDomain mapToStock(StockResponseModel model) => StockDomain(
      id: model.id,
      category: model.category,
      title: model.title,
      ticker: model.ticker,
      tickerTradingView: model.tickerTradingview,
      logo: model.logo,
      website: model.website,
      potential: model.potential,
      dividends: model.dividends,
      tradingUrl: model.tradingUrl,
      ipoDate: model.ipoDate,
      timerDateIpo: model.timerDateIpo,
      transactionClosingDate: model.transactionClosingDate,
      accommodationPrice: model.accommodationPrice,
      priceAfterOpeningIpo: model.priceAfterOpeningIpo,
      transactionClosingPrice: model.transactionClosingPrice,
      marketCapitalization: model.marketCapitalization,
      assessedValue: model.assessedValue,
      foundationCompany: model.foundationCompany,
      investors: model.investors,
      lockUp: model.lockUp,
      profitabilityPercentage: model.profitabilityPercentage,
      transactionOpenDate: model.transactionOpenDate,
      transactionOpenPrice: model.transactionOpenPrice,
      isNew: model.isNew,
      hit: model.hit,
      volumeMin: model.volumeMin,
      descriptions: model.descriptions?.map(
        (key, value) => MapEntry(
          key,
          mapToLocaleText(value),
        ),
      ),
      logoUri: model.logoUri,
      shortDescription: model.shortDescription,
      longDescription: model.longDescription,
      languages: model.languages,
    );

List<StockDomain>? mapListToStock(
  List<StockResponseModel> list,
) =>
    list.map((model) => mapToStock(model)).toList();
