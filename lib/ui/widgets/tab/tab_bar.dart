import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_trade/resources/colors/common_colors.dart';
import 'package:one_trade/ui/widgets/tab/tab_bar_item.dart';

class PrimaryTabBar extends StatelessWidget {
  const PrimaryTabBar({
    Key? key,
    this.labels = const [],
    this.currentTab,
    this.backgroundColor = blueAccent,
    required this.onTabChanged,
  }) : super(key: key);

  final List<String> labels;
  final Function(int) onTabChanged;
  final int? currentTab;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60.h,
      padding: EdgeInsets.all(5.w),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(50.r),
        ),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Stack(
          children: [
            AnimatedAlign(
              alignment: Alignment(currentTab == 0 ? -1 : 1, 0),
              duration: Duration(milliseconds: 100),
              child: Container(
                height: double.infinity,
                width: constraints.maxWidth / labels.length,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.r),
                  ),
                ),
              ),
            ),
            Row(
              children: mapTabLabels(),
            ),
          ],
        );
      }),
    );
  }

  List<Widget> mapTabLabels() {
    List<Widget> result = [];
    for (var i = 0; i < labels.length; i++) {
      result.add(Expanded(
        child: TabBarItem(
          label: labels[i],
          isActive: currentTab == i,
          onTab: () => onTabChanged(i),
        ),
      ));
    }
    return result;
  }
}
