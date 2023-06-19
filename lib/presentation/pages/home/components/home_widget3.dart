import 'package:agent_007/presentation/assets/res/screen_size.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeWidget3 extends StatelessWidget {
  const HomeWidget3({
    super.key,
    required this.title,
    required this.coast,
  });
  final String title;
  final String coast;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
          vertical: ScreenSize.h8, horizontal: ScreenSize.w12),
      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: AppTheme.colors.secondary,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 3)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTheme.data.textTheme.headlineMedium,
          ),
          Text(
            coast,
            style: AppTheme.data.textTheme.headlineMedium,
          )
        ],
      ),
    );
  }
}
