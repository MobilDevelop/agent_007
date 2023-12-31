import 'package:agent_007/infrasutruktura/helper_method/helper_method.dart';
import 'package:agent_007/infrasutruktura/models/dashboard/dashboard_model.dart';
import 'package:agent_007/presentation/assets/res/screen_size.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeWidget2 extends StatelessWidget {
  const HomeWidget2({
    super.key, required this.model,
  });
  final DashboardModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(
          vertical: ScreenSize.h8, horizontal: ScreenSize.w12),
      padding: EdgeInsets.symmetric(
          horizontal: ScreenSize.w16, vertical: ScreenSize.h20),
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tr('dashboard.allmoney'),
                  style: AppTheme.data.textTheme.displayLarge),
              Text(Helper.toProcessCost(model.allPrice.toString()), style: AppTheme.data.textTheme.displayLarge),
            ],
          ),
          SizedBox(
            height: 170.w,
            width: 170.w,
            child: CircularProgressIndicator(
              value: double.parse(model.expenses) /(double.parse(model.currentBalans)==0.0?1.0:double.parse(model.currentBalans)),
              color: AppTheme.colors.gray,
              backgroundColor: AppTheme.colors.primary,
              strokeWidth: 45,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(tr('dashboard.joriybalans'),
                      style: AppTheme.data.textTheme.bodyLarge),
                  Gap(ScreenSize.w6),
                  Container(
                    height: 20.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppTheme.colors.primary),
                  )
                ],
              ),
              Row(
                children: [
                  Text(tr('dashboard.xarajat'),
                      style: AppTheme.data.textTheme.bodyLarge),
                  Gap(ScreenSize.w6),
                  Container(
                    height: 20.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppTheme.colors.gray),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
