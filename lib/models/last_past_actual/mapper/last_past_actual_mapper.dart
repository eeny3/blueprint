import 'package:one_trade/domain/last_past_actual_domain.dart';
import 'package:one_trade/models/last_past_actual/last_past_actual_response_model.dart';
import 'package:one_trade/models/stock_response/mapper/stock_mapper.dart';

LastPastActualDomain mapToLastPastActual(LastPastActualResponseModel model) =>
    LastPastActualDomain(
      otc: model.otc?.map((e) => mapToStock(e)).toList(),
      ipoPast: model.ipoPast?.map((e) => mapToStock(e)).toList(),
      ipoCurrent: model.ipoCurrent?.map((e) => mapToStock(e)).toList(),
    );
