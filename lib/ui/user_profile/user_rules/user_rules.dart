import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/user_profile/user_rules/user_rules_wm.dart';
import 'package:one_trade/ui/user_profile/widgets/navigation_tile.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

// Страница с пользовательскими соглашениями
class UserRulesScreen extends ElementaryWidget<IUserRulesWidgetModel> {
  const UserRulesScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IUserRulesWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Material(
            type: MaterialType.transparency,
            clipBehavior: Clip.hardEdge,
            child: InkWell(
              onTap: wm.goBack,
              child: Icon(
                Icons.chevron_left_rounded,
                color: primaryColor,
                size: 40.r,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 17.w),
            child: TextLocale(
              'rules_and_agreements',
              style: textBold700Size30Black,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          NavigationTile(
            titleKey: 'privacy_policy',
            onTap: wm.onPrivacyPolicyTapped,
          ),
          NavigationTile(
            titleKey: 'user_agreement',
            onTap: wm.onUserAgreementTapped,
          ),
          NavigationTile(
            titleKey: 'personal_data_processing',
            onTap: wm.onPersonalDataProcessingTapped,
          ),
          NavigationTile(
            titleKey: 'selling_rules',
            onTap: wm.onSellingRulesTapped,
          ),
        ],
      ),
    );
  }
}

/// Навигация к странице [UserRulesScreen]
class UserRulesScreenRoute extends MaterialPageRoute {
  UserRulesScreenRoute()
      : super(
          builder: (context) => const UserRulesScreen(),
        );
}
