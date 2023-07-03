import 'package:agent_007/infrasutruktura/models/transfer/get_transfer.dart';
import 'package:agent_007/presentation/assets/res/screen_size.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransferWidget2 extends StatelessWidget {
  const TransferWidget2({
    super.key,
    required this.index,
    required this.ontap,
    required this.item,
  });
  final int index;
  final Function ontap;
  final GetTransfer item;

  @override
  Widget build(BuildContext context) {
    return f_bounce.Bounce(
      onPressed: () {
        index == 1
            ? AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    body: Center(
                      child: Text(
                        "O'tkazmani tasdiqlash",
                        style: AppTheme.data.textTheme.displaySmall,
                      ),
                    ),
                    btnCancelText: tr('transfer.cancel'),
                    btnOkText: tr('transfer.ok'),
                    btnOkOnPress: () => ontap(item.id),
                    btnCancelOnPress: () {})
                .show()
            : Container();
      },
      duration: index == 1
          ? const Duration(milliseconds: 150)
          : const Duration(microseconds: 0),
      child: Container(
        width: double.maxFinite,
        height: 150.h,
        margin: EdgeInsets.symmetric(
            horizontal: ScreenSize.w10, vertical: ScreenSize.h6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                width: 1.5,
                color: index == 1
                    ? AppTheme.colors.primary
                    : index == 2
                        ? AppTheme.colors.red
                        : AppTheme.colors.green)),
      ),
    );
  }
}
