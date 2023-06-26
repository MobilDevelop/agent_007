import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransferWidget3 extends StatelessWidget {
  const TransferWidget3({
    super.key,
    required this.ontap,
  });
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: 500.h,
      width: double.maxFinite,
      padding: EdgeInsets.only(
          top: ScreenSize.h8,
          left: width * 0.05,
          right: width * 0.05,
          bottom: ScreenSize.h16),
      decoration: BoxDecoration(
          color: AppTheme.colors.secondary,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 8.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: AppTheme.colors.black,
                    borderRadius: BorderRadius.circular(4.r)),
              ),
              Gap(ScreenSize.h10),
              Text(tr('transfer.pulotkazish'),
                  style: AppTheme.data.textTheme.displaySmall)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              f_bounce.Bounce(
                onPressed: () {
                  Navigator.pop(context);
                },
                duration: const Duration(milliseconds: 150),
                child: Container(
                  height: 55.h,
                  width: width * 0.42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: AppTheme.colors.red, width: 1.5),
                      borderRadius: BorderRadius.circular(18.r)),
                  child: Text(tr('transfer.cancel'),
                      style: AppTheme.data.textTheme.displayLarge!
                          .copyWith(color: AppTheme.colors.red)),
                ),
              ),
              f_bounce.Bounce(
                onPressed: ontap,
                duration: const Duration(milliseconds: 150),
                child: Container(
                  height: 55.h,
                  width: width * 0.42,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppTheme.colors.green,
                      borderRadius: BorderRadius.circular(18.r)),
                  child: Text(tr('transfer.ok'),
                      style: AppTheme.data.textTheme.displayLarge!
                          .copyWith(color: AppTheme.colors.secondary)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
