import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/closed/portfolio_detail_deals_closed_view.dart';
import 'package:one_trade/ui/portfolio_detail_screen/portfolio_detail_deals_view/opened/portfolio_detail_deals_opened_view.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

import 'closed/portfolio_detail_account_details_view.dart';

/// Страница Подробностей о счете пользователя
class PortfolioDetailAccountDetails extends StatefulWidget {
  const PortfolioDetailAccountDetails({Key? key,})
      : super(key: key);


  @override
  State<PortfolioDetailAccountDetails> createState() =>
      _PortfolioDetailAccountDetailsState();
}

class _PortfolioDetailAccountDetailsState
    extends State<PortfolioDetailAccountDetails> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Expanded(
          child:
              PortfolioDetailAccountDetailsView(),
        )
      ],
    );
  }
}
