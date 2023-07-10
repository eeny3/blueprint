import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/resources/text_styles.dart';
import 'package:one_trade/ui/widgets/locale/text_locale.dart';

/// Виджет диалога для связи пользователя для получения поддержки
class ContactsDialogBody extends StatelessWidget {
  /// Переход к написанию письма
  final VoidCallback onWriteLetterTapped;

  /// Переход к онлайн чату
  final VoidCallback onOnlineChatTapped;

  /// Переход к WhatsApp
  final VoidCallback onWhatsAppTapped;

  /// Переход в Telegram
  final VoidCallback onTelegramTapped;

  /// Осуществление звонка
  final VoidCallback onCallTapped;

  const ContactsDialogBody({
    required this.onWriteLetterTapped,
    required this.onOnlineChatTapped,
    required this.onWhatsAppTapped,
    required this.onTelegramTapped,
    required this.onCallTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 410.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 15.h,
          ),
          Container(
            height: 3.h,
            width: 30.w,
            decoration: BoxDecoration(
              color: gray5,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  90.r,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 45.h,
          ),
          GestureDetector(
            onTap: onWriteLetterTapped,
            child: TextLocale(
              'write_letter',
              style: textPrimary600Size24GreyAccent,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          GestureDetector(
            onTap: onOnlineChatTapped,
            child: TextLocale(
              'online_chat',
              style: textPrimary600Size24GreyAccent,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          GestureDetector(
            onTap: onWhatsAppTapped,
            child: TextLocale(
              'whatsapp',
              style: textPrimary600Size24GreyAccent,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          GestureDetector(
            onTap: onTelegramTapped,
            child: TextLocale(
              'telegram',
              style: textPrimary600Size24GreyAccent,
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          GestureDetector(
            onTap: onCallTapped,
            child: TextLocale(
              'call',
              style: textPrimary600Size24GreyAccent,
            ),
          ),
        ],
      ),
    );
  }
}
