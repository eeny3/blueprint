import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/interactors/locale/locale_interactor.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/ui/password_input_screen/password_input_screen.dart';
import 'package:one_trade/ui/password_input_screen/widgets/password_input_screen_button.dart';
import 'package:one_trade/ui/password_input_screen/widgets/password_input_screen_header.dart';
import 'package:one_trade/ui/password_input_screen/widgets/password_input_screen_textfield.dart';

class CreatePasswordScreen extends StatefulWidget {
  /// Номер телефона
  final String phone;

  /// id юзера
  final String id;

  const CreatePasswordScreen({Key? key, required this.phone, required this.id})
      : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  final TextEditingController _controller = TextEditingController();
  bool isButtonActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 60.h,
              ),
              const PasswordInputScreenHeader(
                headerTitle: 'create_password',
              ),
              const Spacer(),
              PasswordTextField(
                controller: _controller,
                inputColor: lightGrey,
                onChanged: (value) {
                  if (!isButtonActive && _controller.text.isNotEmpty) {
                    setState(() {
                      isButtonActive = true;
                    });
                  }
                  if (isButtonActive && _controller.text.isEmpty) {
                    setState(() {
                      isButtonActive = false;
                    });
                  }
                },
              ),
              const Spacer(),
              const Spacer(),
              CustomButton(
                title: getLocaleString('continue'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => PasswordInputScreen(
                        widget.phone,
                        widget.id,
                        _controller.text,
                      ),
                    ),
                  );
                },
                isActive: isButtonActive,
              ),
              SizedBox(height: 34.h),
            ],
          ),
        ),
      ),
    );
  }
}