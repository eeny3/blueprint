import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница после успешного открытия счета
class RegisterAccountSuccessScreen extends StatelessWidget {
  const RegisterAccountSuccessScreen({Key? key, required this.account})
      : super(key: key);

  final AccountDomain account;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment(1, 0),
                child: GestureDetector(
                  onTap: () => Navigator.popUntil(
                    context,
                    (route) => route.settings.name == '/',
                  ),
                  child: SvgPicture.asset(
                    icClose,
                    width: 26.r,
                    height: 26.r,
                  ),
                ),
              ),
              Expanded(
                child: SvgPicture.asset(
                  icCheckCircleLarge,
                  height: 200.h,
                  width: 200.w,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: TextLocale(
                  'account_created',
                  style: textPrimary600Size30GreyAccent,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 73.h),
                child: TextLocale(
                  'account_created_with_number',
                  style: textPrimary500Size18BlueGrey,
                  namedArgs: {'number': '${account.login}'},
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 17).copyWith(bottom: 60.h),
                child: SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: 'navigate_to_cash_account',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Навигация к странице [RegisterAccountSuccessScreen]
class RegisterAccountSuccessScreenRoute extends MaterialPageRoute {
  RegisterAccountSuccessScreenRoute(AccountDomain account)
      : super(
          builder: (context) => RegisterAccountSuccessScreen(
            account: account,
          ),
        );
}
