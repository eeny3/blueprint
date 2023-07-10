import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/user_profile/user_personals/user_personals_wm.dart';
import 'package:one_trade/ui/user_profile/widgets/user_info_widget.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

// Страница с личными данными пользователя
class UserPersonalsScreen extends ElementaryWidget<IUserPersonalsWidgetModel> {
  const UserPersonalsScreen({
    Key? key,
    WidgetModelFactory wmFactory = defaultAppWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IUserPersonalsWidgetModel wm) {
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
              'personal_data',
              style: textBold700Size30Black,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          UserInfoWidget(
            propertyKey: 'last_name',
            controller: wm.lastNameEditingController,
          ),
          SizedBox(
            height: 30.h,
          ),
          UserInfoWidget(
            propertyKey: 'first_name',
            controller: wm.firstNameEditingController,
          ),
          SizedBox(
            height: 30.h,
          ),
          UserInfoWidget(
            propertyKey: 'second_name',
            controller: wm.secondNameEditingController,
          ),
          SizedBox(
            height: 30.h,
          ),
          UserInfoWidget(
            propertyKey: 'day_of_birth',
            controller: wm.dayOfBirthEditingController,
            onTextFieldTap: wm.showDatePicker,
          ),
          SizedBox(
            height: 30.h,
          ),
          UserInfoWidget(
            propertyKey: 'address',
            controller: wm.addressEditingController,
          ),
        ],
      ),
    );
  }
}

/// Навигация к странице [UserPersonalsScreen]
class UserPersonalsScreenRoute extends MaterialPageRoute {
  UserPersonalsScreenRoute()
      : super(
          builder: (context) => const UserPersonalsScreen(),
        );
}
