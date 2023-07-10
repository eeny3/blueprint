import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/domain/account_domain.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/register_account/register_account_screen_wm.dart';
import 'package:one_trade/ui/register_account/widgets/link_text.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';
import 'package:one_trade/ui/widgets/form/primary_text_field.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страница открытия счета
class RegisterAccountScreen
    extends ElementaryWidget<IRegisterAccountScreenWidgetModel> {
  const RegisterAccountScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IRegisterAccountScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: wm.goBack,
          child: Icon(
            Icons.chevron_left_rounded,
            color: primaryColor,
            size: 40.r,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: TextLocale(
                  'account_registration',
                  style: textBold800Size26Black,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: TextLocale(
                  'account_registration_subtitle',
                  style: textPrimary500Size16BlueGrey,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: StateNotifierBuilder<String?>(
                    listenableState: wm.accountName,
                    builder: (
                      BuildContext context,
                      String? accountName,
                    ) {
                      return PrimaryTextField(
                        height: 75.h,
                        value: accountName,
                        textAlign: TextAlign.center,
                        hintStyle: textPrimary600Size24Grey3,
                        borderRadius: 25.r,
                        hintText: 'account_name',
                        onChange: wm.accountNameChanged,
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 50.h),
                child: TextLocale(
                  'account_registration_policy_title',
                  style: textBold500Size16Grey2,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: LinkText(text: 'privacy_policy'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: LinkText(text: 'risk_notify'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: LinkText(text: 'client_agreement'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: LinkText(text: 'aml_and_kyc_policy'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: LinkText(text: 'refund_policy'),
              ),
              SizedBox(
                width: double.infinity,
                height: 60.h,
                child: StateNotifierBuilder<AccountDomain>(
                    listenableState: wm.createdAccount,
                    builder: (
                      BuildContext context,
                      AccountDomain? createdAccount,
                    ) {
                      return PrimaryButton(
                        onPressed: wm.createAccount,
                        text: 'open_account',
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Навигация к странице [RegisterAccountScreen]
class RegisterAccountScreenRoute extends MaterialPageRoute {
  RegisterAccountScreenRoute()
      : super(
          builder: (context) => const RegisterAccountScreen(),
        );
}
