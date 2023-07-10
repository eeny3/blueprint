import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/images.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:country_pickers/country_pickers.dart';

String countryCode = '+7';

class PhoneTextField extends StatefulWidget {
  final Color inputColor;
  final TextEditingController controller;

  const PhoneTextField({
    Key? key,
    required this.inputColor,
    required this.controller,
  }) : super(key: key);

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  Country selectedValue = CountryPickerUtils.getCountryByIsoCode('RU');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: widget.inputColor,
        borderRadius: BorderRadius.circular(25.r),
      ),
      child: Row(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<Country>(
              isExpanded: true,
              selectedItemBuilder: (context) {
                return countryList.map<Widget>(
                  (Country country) {
                    return CountryPickerUtils.getDefaultFlagImage(country);
                  },
                ).toList();
              },
              items: countryList
                  .map((item) => DropdownMenuItem<Country>(
                        value: item,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CountryPickerUtils.getDefaultFlagImage(item),
                                SizedBox(
                                  width: 5.w,
                                ),
                                SizedBox(
                                  width: 180.w,
                                  child: Text(
                                    item.name,
                                    style: textPrimary400Size16Black,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              '+' + item.phoneCode,
                              style: textBold700Size16Black,
                            ),
                          ],
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as Country;
                  countryCode = '+' + selectedValue.phoneCode;
                });
              },
              itemSplashColor: grey5,
              icon: SvgPicture.asset(icArrowDown),
              iconOnClick: SvgPicture.asset(icArrowUp),
              iconSize: 14.w,
              buttonHeight: 20.h,
              buttonWidth: 50.w,
              dropdownMaxHeight: 200,
              dropdownWidth: screenWidth - 30,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: widget.inputColor,
              ),
              dropdownPadding: EdgeInsets.symmetric(horizontal: 6.w),
              dropdownElevation: 0,
              scrollbarAlwaysShow: false,
              offset: const Offset(-21, -36),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            countryCode,
            style: textBold700Size24BlackSpacing3,
          ),
          SizedBox(
            width: 3.w,
          ),
          Expanded(
            child: TextField(
              enabled: false,
              controller: widget.controller,
              style: text400Size24BlackSpacing3,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 22.w),
                filled: true,
                fillColor: widget.inputColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
