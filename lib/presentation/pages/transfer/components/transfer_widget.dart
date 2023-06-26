import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class TransferWidget1 extends StatelessWidget {
  const TransferWidget1({
    super.key,
    required this.sizeWidth,
    required this.animationSize1,
    required this.animationSize2,
    required this.ontap,
  });

  final double sizeWidth;
  final double animationSize1;
  final double animationSize2;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Gap(ScreenSize.h4),
      Container(
          height: 70.h,
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.03),
          child: Row(children: [
            GestureDetector(
              onTap: () => ontap(1),
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  height: 60.h,
                  alignment: Alignment.center,
                  width:
                      animationSize1 == 0 ? sizeWidth * 0.45 : animationSize1,
                  decoration: BoxDecoration(
                      color: AppTheme.colors.primary,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: animationSize1 == sizeWidth * 0.15
                      ? SvgPicture.asset(
                          AppIcons.left,
                          color: AppTheme.colors.secondary,
                        )
                      : Text("Kirimlar"
                      ,maxLines: 1
                      ,style: AppTheme.data.textTheme.headline5!.copyWith(color: AppTheme.colors.secondary))),
            ),
            Gap(sizeWidth * 0.04),
            GestureDetector(
              onTap: () => ontap(2),
              child: AnimatedContainer(
                  duration: const Duration(milliseconds: 800),
                  height: 60.h,
                  width:
                      animationSize2 == 0 ? sizeWidth * 0.45 : animationSize2,
                      alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppTheme.colors.gray,
                      borderRadius: BorderRadius.circular(15.r)),
                  child: animationSize2 == sizeWidth * 0.15
                      ? SvgPicture.asset(
                          AppIcons.right1,
                          color: AppTheme.colors.secondary,
                        )
                      :Text("Chiqimlar"
                      ,maxLines: 1
                      ,style: AppTheme.data.textTheme.headline5!.copyWith(color: AppTheme.colors.secondary))),
            )
          ]))
    ]);
  }
}
