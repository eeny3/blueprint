import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:one_trade/ui/widgets/loader.dart';

class PrimaryLayout<T> extends StatelessWidget {
  final Widget body;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final PreferredSizeWidget? appBar;
  final bool? resizeToAvoidBottomInset;

  const PrimaryLayout({
    Key? key,
    required this.body,
    this.backgroundColor,
    this.padding,
    this.appBar,
    this.resizeToAvoidBottomInset,
  }) : super(key: key);

  factory PrimaryLayout.state({
    Key? key,
    required EntityStateNotifier<T> screenState,
    required DataWidgetBuilder<T> builder,
    //required VoidCallback onPressRefresh,
    Color? backgroundColor,
    EdgeInsets? padding,
    PreferredSizeWidget? appBar,
    bool? resizeToAvoidBottomInset,
    bool isShowLogoLoader = true,
  }) {
    return PrimaryLayout(
      key: key,
      body: EntityStateNotifierBuilder<T>(
        listenableEntityState: screenState,
        builder: builder,
        loadingBuilder: (_, __) => const Loader(),
        errorBuilder: (
          context,
          e,
          data,
        ) {
          /// TODO спросить у дизайнера виджеты для ошибок
          return Container();
        },
      ),
      backgroundColor: backgroundColor,
      padding: padding,
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      backgroundColor: backgroundColor ?? backgroundColor,
      appBar: appBar,
      body: body,
    );
  }
}
