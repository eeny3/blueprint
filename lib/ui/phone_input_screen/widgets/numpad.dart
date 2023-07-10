import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/ui/phone_input_screen/widgets/numpad_digit.dart';

/// Клавиатура
class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final Widget? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Widget? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final ValueChanged<String> onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  const NumericKeyboard({
    Key? key,
    required this.onKeyboardTap,
    this.textColor = Colors.black,
    this.rightButtonFn,
    this.rightIcon,
    this.leftButtonFn,
    this.leftIcon,
    this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  final _keys = [
    ['1', '4', '7'],
    ['2', '5', '8'],
    ['3', '6', '9'],
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            for (List<String> rows in _keys)
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (String value in rows)
                    NumpadDigit(
                      value: value,
                      onKeyboardTap: widget.onKeyboardTap,
                    ),
                ],
              ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(45.r),
              onTap: widget.leftButtonFn,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  21.w,
                  18.5.w,
                  32.w,
                  18.5.w,
                ),
                child: widget.leftIcon,
              ),
            ),
            NumpadDigit(
              value: '0',
              onKeyboardTap: widget.onKeyboardTap,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(45.r),
              onTap: widget.rightButtonFn,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 30.5.w,
                  vertical: 18.5.w,
                ),
                child: widget.rightIcon,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
