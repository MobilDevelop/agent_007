import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class ExpensesWidget1 extends StatelessWidget {
  const ExpensesWidget1({
    super.key,
    required this.ontap,
    required this.inActive,
    required this.height,
  });
  final VoidCallback ontap;
  final bool inActive;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        width: double.maxFinite,
        height: inActive ? height : 60.0.h,
        padding: EdgeInsets.only(
          left: ScreenSize.w10,
          top: ScreenSize.h14,
          right: ScreenSize.w4,
        ),
        margin: EdgeInsets.symmetric(
            vertical: ScreenSize.h6, horizontal: ScreenSize.w10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppTheme.colors.primary, width: 1.5)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("12 mln", style: AppTheme.data.textTheme.displaySmall),
                  Row(
                    children: [
                      Text("12.06.2023",
                          style: AppTheme.data.textTheme.displaySmall),
                      SvgPicture.asset(
                        AppIcons.bottom1,
                        height: 30.h,
                      )
                    ],
                  ),
                ],
              ),
             Gap(ScreenSize.h10),
             Container(
              padding: EdgeInsets.only(right:28.w),
               child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("12 mln", style: AppTheme.data.textTheme.displaySmall),
                    Text("12.06.2023",
                        style: AppTheme.data.textTheme.displaySmall),
                  ],
                ),
             ),
             
            ],
          ),
        ),
      ),
    );
  }
}
