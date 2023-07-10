import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/user_profile/home_user_profile/home_user_profile_wm.dart';
import 'package:one_trade/ui/user_profile/widgets/navigation_card.dart';
import 'package:one_trade/ui/user_profile/widgets/user_avatar.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

// Домашняя страница профиля пользователя
class HomeUserProfileScreen
    extends ElementaryWidget<IHomeUserProfileWidgetModel> {
  const HomeUserProfileScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IHomeUserProfileWidgetModel wm) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: 40.w,
                        top: 1.h,
                      ),
                      child: StateNotifierBuilder<String?>(
                        listenableState: wm.userNameState,
                        builder: (
                          BuildContext context,
                          String? userName,
                        ) {
                          return UserAvatar(
                            letter: userName?[0] ?? '',
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              StateNotifierBuilder<String?>(
                listenableState: wm.userNameState,
                builder: (
                  BuildContext context,
                  String? userName,
                ) {
                  return Text(
                    userName ?? '',
                    style: textPrimary700Size28,
                  );
                },
              ),
              SizedBox(
                height: 45.h,
              ),
              StateNotifierBuilder<String?>(
                listenableState: wm.userNameState,
                builder: (
                  BuildContext context,
                  String? userName,
                ) {
                  if (wm.userVerifiedState.value != true) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 40.h),
                      child: NavigationCard(
                        title: 'account_verification',
                        isFilling: true,
                        onTap: wm.onVerificationTapped,
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
              NavigationCard(
                title: 'personal_info',
                onTap: wm.onPersonalDataTapped,
              ),
              SizedBox(
                height: 20.h,
              ),
              NavigationCard(
                title: 'change_phone_number',
                onTap: wm.onChangePhoneNumberTapped,
              ),
              SizedBox(
                height: 20.h,
              ),
              NavigationCard(
                title: 'change_email',
                onTap: wm.onChangeEmailTapped,
              ),
              SizedBox(
                height: 20.h,
              ),
              NavigationCard(
                title: 'rules_and_agreements',
                onTap: wm.onRulesTapped,
              ),
              SizedBox(
                height: 20.h,
              ),
              NavigationCard(
                title: 'language',
                onTap: wm.onSelectLanguageTapped,
              ),
              SizedBox(
                height: 70.h,
              ),
              Container(
                width: 360.w,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Material(
                  type: MaterialType.transparency,
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: wm.onContactUsTapped,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: TextLocale(
                          'contact_us',
                          style: textPrimary500Size18Primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: wm.onExitTapped,
                child: SizedBox(
                  height: 55.h,
                  child: Center(
                    child: TextLocale(
                      'exit',
                      style: textPrimary500Size18Danger,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 7.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Навигация к странице [HomeUserProfileScreen]
class HomeUserProfileScreenRoute extends MaterialPageRoute {
  HomeUserProfileScreenRoute()
      : super(
          builder: (context) => const HomeUserProfileScreen(),
        );
}
