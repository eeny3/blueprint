import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/password_input_screen/widgets/password_input_screen_button.dart';
import 'package:one_trade/ui/profile_info_screen/profile_info_screen_wm.dart';
import 'package:one_trade/ui/profile_info_screen/widgets/date_picker.dart';
import 'package:one_trade/ui/profile_info_screen/widgets/profile_info_screen_textfield.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Страрница заполнения анкеты
class ProfileInfoInputScreen
    extends ElementaryWidget<ProfileInfoInputScreenWM> {
  /// Номер телефона
  final String phone;
  /// Юрисдикция
  final String jurisdiction;

  const ProfileInfoInputScreen(this.phone, this.jurisdiction, {Key? key})
      : super(createProfileInfoInputScreensWM, key: key);

  @override
  Widget build(ProfileInfoInputScreenWM wm) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        iconTheme: const IconThemeData(
          color: primaryColor,
        ),
        elevation: 0,
      ),
      body: EntityStateNotifierBuilder(
          listenableEntityState: wm.registrationFourthStepState,
          loadingBuilder: (_, __) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          },
          builder: (_, __) {
            return SingleChildScrollView(
              child: SizedBox(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextLocale(
                          "personal_info",
                          style: textBold700Size30Black,
                        ),
                        SizedBox(height: 28.h),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              PageTextField(
                                hintText: getLocaleString('last_name'),
                                controller: wm.lastNameController,
                                isEnabled: true,
                              ),
                              const Spacer(),
                              PageTextField(
                                hintText: getLocaleString('first_name'),
                                controller: wm.firstNameController,
                                isEnabled: true,
                              ),
                              const Spacer(),
                              PageTextField(
                                hintText: getLocaleString('fathers_name'),
                                controller: wm.fathersNameController,
                                isEnabled: true,
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  //TODO обернуть в каркас боттом шита когда будет готово
                                  showModalBottomSheet(
                                    context: wm.context,
                                    builder: (BuildContext context) {
                                      return DatePicker(
                                        dobFieldController: wm.dobController,
                                      );
                                    },
                                  );
                                },
                                child: PageTextField(
                                  hintText: getLocaleString('date_of_birth'),
                                  controller: wm.dobController,
                                  isEnabled: false,
                                ),
                              ),
                              const Spacer(),
                              //TODO добавить подсказки и автозаполнение
                              PageTextField(
                                hintText: getLocaleString('address'),
                                controller: wm.addressController,
                                isEnabled: true,
                              ),
                              const Spacer(),
                              PageTextField(
                                hintText: getLocaleString('email'),
                                controller: wm.emailController,
                                isEnabled: true,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 100.h),
                        CustomButton(
                          title: 'Продолжить',
                          onTap: () {
                            //TODO переделать под новый апи
                            //wm.onButtonPressed(phone);
                          },
                          isActive: false,
                        ),
                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
