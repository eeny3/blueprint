// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockResponseModel _$StockResponseModelFromJson(Map<String, dynamic> json) =>
    StockResponseModel(
      id: json['id'] as int?,
      category: json['category'] as int?,
      title: json['title'] as String?,
      ticker: json['ticker'] as String?,
      tickerTradingview: json['tickerTradingview'] as String?,
      logo: json['logo'] as String?,
      website: json['website'] as String?,
      potential: json['potential'] as String?,
      dividends: json['dividends'] as String?,
      tradingUrl: json['tradingUrl'] as String?,
      ipoDate: json['ipoDate'] == null
          ? null
          : DateTime.parse(json['ipoDate'] as String),
      timerDateIpo: json['timerDateIpo'] == null
          ? null
          : DateTime.parse(json['timerDateIpo'] as String),
      transactionClosingDate: json['transactionClosingDate'] as String?,
      accommodationPrice: json['accommodationPrice'] as num?,
      priceAfterOpeningIpo: json['priceAfterOpeningIpo'] as num?,
      transactionClosingPrice: json['transactionClosingPrice'] as num?,
      marketCapitalization: json['marketCapitalization'] as num?,
      assessedValue: json['assessedValue'] as int?,
      foundationCompany: json['foundationCompany'] as int?,
      investors: json['investors'] as String?,
      lockUp: json['lockUp'] as String?,
      profitabilityPercentage: json['profitabilityPercentage'] as num?,
      transactionOpenDate: json['transactionOpenDate'] as String?,
      transactionOpenPrice: json['transactionOpenPrice'] as num?,
      isNew: json['isNew'] as bool?,
      hit: json['hit'] as bool?,
      volumeMin: json['volumeMin'] as int?,
      descriptions: (json['descriptions'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k, LocaleTextResponseModel.fromJson(e as Map<String, dynamic>)),
      ),
      logoUri: json['logoUri'] as String?,
      shortDescription: json['shortDescription'] as String?,
      longDescription: json['longDescription'] as String?,
      languages: (json['languages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$StockResponseModelToJson(StockResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'title': instance.title,
      'ticker': instance.ticker,
      'tickerTradingview': instance.tickerTradingview,
      'logo': instance.logo,
      'website': instance.website,
      'potential': instance.potential,
      'dividends': instance.dividends,
      'tradingUrl': instance.tradingUrl,
      'ipoDate': instance.ipoDate?.toIso8601String(),
      'timerDateIpo': instance.timerDateIpo?.toIso8601String(),
      'transactionClosingDate': instance.transactionClosingDate,
      'accommodationPrice': instance.accommodationPrice,
      'priceAfterOpeningIpo': instance.priceAfterOpeningIpo,
      'transactionClosingPrice': instance.transactionClosingPrice,
      'marketCapitalization': instance.marketCapitalization,
      'assessedValue': instance.assessedValue,
      'foundationCompany': instance.foundationCompany,
      'investors': instance.investors,
      'lockUp': instance.lockUp,
      'profitabilityPercentage': instance.profitabilityPercentage,
      'transactionOpenDate': instance.transactionOpenDate,
      'transactionOpenPrice': instance.transactionOpenPrice,
      'isNew': instance.isNew,
      'hit': instance.hit,
      'volumeMin': instance.volumeMin,
      'descriptions': instance.descriptions,
      'logoUri': instance.logoUri,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'languages': instance.languages,
    };
