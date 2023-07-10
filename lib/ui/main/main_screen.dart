import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/styles.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/portfolio_screen/portfolio_screen.dart';
import 'package:one_trade/ui/widgets/buttons/default_button.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Основная страница с нижней навигацией
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late StreamSubscription _connectivitySubs;

  @override
  void initState() {
    super.initState();
    _connectivitySubs =
        Connectivity().onConnectivityChanged.listen(_connectivityListener);
  }

  @override
  void dispose() {
    _connectivitySubs.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PortfolioScreen(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: textPrimary500Size12Grey,
        selectedLabelStyle: textPrimary500Size12Grey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icPortfolio,
              width: 20.w,
              height: 17.h,
            ),
            label: getLocaleString('portfolio'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icHistory,
              width: 24.w,
              height: 18.h,
            ),
            label: getLocaleString('history'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icLearning,
              width: 18.w,
              height: 18.h,
            ),
            label: getLocaleString('learning'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icPartnership,
              width: 16.w,
              height: 18.h,
            ),
            label: getLocaleString('partner'),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              icTerminal,
              width: 16.w,
              height: 18.h,
            ),
            label: getLocaleString('terminal'),
          ),
        ],
      ),
    );
  }

  _showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Color(0x80183256),
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                height: 300.h,
                margin: EdgeInsets.symmetric(horizontal: 25.w),
                padding: EdgeInsets.symmetric(
                  vertical: 20.h,
                  horizontal: 20.w,
                ).copyWith(top: 40.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  color: whiteColor,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 18.h),
                      child: TextLocale(
                        'no_network',
                        style: textPrimary600Size26GreyAccent,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 18.h),
                      child: TextLocale(
                        'no_network_desc',
                        style: textPrimary500Size22Grey3,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: PrimaryButton(
                        onPressed: () {},
                        style: roundedRadius15Transparent,
                        textStyle: textPrimary500Size18Primary,
                        text: 'ok',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _connectivityListener(ConnectivityResult event) {
    if (event == ConnectivityResult.none) {
      _showNoInternetDialog(context);
    }
  }
}
