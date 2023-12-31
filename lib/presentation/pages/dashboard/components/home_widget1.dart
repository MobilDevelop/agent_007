import 'package:agent_007/infrasutruktura/helper_method/helper_method.dart';
import 'package:agent_007/presentation/assets/res/screen_size.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key, required this.name,
  });
   final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
          vertical: 2.h, horizontal: ScreenSize.w12),
      padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.w10, vertical: ScreenSize.h6),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: AppTheme.colors.secondary,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 3)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${tr('dashboard.salom')} $name",
            style: AppTheme.data.textTheme.headlineMedium,
          ),
          Gap(2.h),
          Text(
            "${tr('dashboard.bugun')} ${Helper.formatDate()}",
            style: AppTheme.data.textTheme.headlineMedium,
          )
        ],
      ),
    );
  }
}
