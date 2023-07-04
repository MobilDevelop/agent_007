import 'package:agent_007/infrasutruktura/helper_method/helper_method.dart';
import 'package:agent_007/infrasutruktura/models/transfer/get_transfer.dart';
import 'package:agent_007/presentation/assets/res/app_icons.dart';
import 'package:agent_007/presentation/assets/res/screen_size.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class TransferWidget2 extends StatelessWidget {
  const TransferWidget2({
    super.key,
    required this.ontapConfirm,
    required this.item, required this.ontapCancel,
  });
  final Function ontapConfirm;
  final Function ontapCancel;
  final GetTransfer? item;

  @override
  Widget build(BuildContext context) {
    if(item==null){
      return const SizedBox();
    }
     return f_bounce.Bounce(
      onPressed: () {
        (item!.cancel && item!.recived)
            ? AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    body: Center(
                      child: Text(
                        tr('universal.confirmmessage'),
                        style: AppTheme.data.textTheme.displaySmall,
                      ),
                    ),
                    btnCancelText: tr('universal.yoq'),
                    btnOkText: tr('universal.ha'),
                    btnOkOnPress: (){
                      ontapConfirm(item!.id);
                    },
                    btnCancelOnPress: () {
                      ontapCancel(item!.id);
                    })
                .show()
            : item!.cancel? AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.error,
                    body: Center(
                      child: Text(
                        tr('transfer.bekor'),
                        style: AppTheme.data.textTheme.displaySmall,
                      ),
                    ),
                    btnCancelText: tr('universal.yoq'),
                    btnOkText: tr('universal.ha'),
                    btnCancelColor: AppTheme.colors.green,
                    btnOkColor: AppTheme.colors.red,
                    btnOkOnPress: (){
                       ontapCancel(item!.id);
                    },
                    btnCancelOnPress: () {
                     
                    })
                    
                .show(): Container();
      },
      duration: item!.status=='Bajarilmoqda...'
          ? const Duration(milliseconds: 150)
          : const Duration(microseconds: 0),
      child:  Container(
        width: double.maxFinite,
         padding: EdgeInsets.only(
          left: ScreenSize.w10,
          top: ScreenSize.h14,
          bottom: ScreenSize.h10,
          right: ScreenSize.w10,
        ),
        margin: EdgeInsets.symmetric(
            horizontal: ScreenSize.w10, vertical: ScreenSize.h6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                width: 2,
                color:item!.type=="Chiqim"?
                               AppTheme.colors.red:AppTheme.colors.green)),
         child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Helper.dateFormat(item!.date),
                    style: AppTheme.data.textTheme.displaySmall),
                Row(
                  children: [
                    Text("№: ",
                        style: AppTheme.data.textTheme.bodyLarge!
                            .copyWith(color: Colors.grey)),
                    Text(item!.id.toString(),
                        style: AppTheme.data.textTheme.displaySmall),
                  ],
                ),
              ],
            ),
            Gap(ScreenSize.h16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr('transfer.otkazuvchi'),
                        style: AppTheme.data.textTheme.bodyLarge!
                            .copyWith(color: Colors.grey)),
                    Text(item!.title,
                        style: AppTheme.data.textTheme.displaySmall),
                  ],
                ),
                SvgPicture.asset(AppIcons.leftRight,
                    height: 20.h, color: Colors.grey),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(tr('transfer.summa'),
                        style: AppTheme.data.textTheme.bodyLarge!
                            .copyWith(color: Colors.grey)),
                    Text(Helper.toProcessCost(item!.amount),
                        style: AppTheme.data.textTheme.displaySmall),
                  ],
                ),
              ],
            ),
            Gap(ScreenSize.h16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(tr('expenses.status'),
                        style: AppTheme.data.textTheme.bodyLarge!
                            .copyWith(color: Colors.grey)),
                    Container(
                      margin: EdgeInsets.only(left: ScreenSize.w6),
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: item!.status=="Bekor qilindi"?
                               AppTheme.colors.red: item!.status=="Yakunlandi"? AppTheme.colors.primary:AppTheme.colors.green),
                    )
                  ],
                ),
                Text(item!.status,
                    style: AppTheme.data.textTheme.displaySmall),
              ],
            ),
            Gap(ScreenSize.h16),
             DottedLine(
              dashColor: AppTheme.colors.gray,
            ),
            Gap(ScreenSize.h12),
            Container(
              width: double.maxFinite,
              alignment: Alignment.centerLeft,
              child: Text(tr('expenses.izoh'),
                  style: AppTheme.data.textTheme.bodyLarge!
                      .copyWith(color: Colors.grey)),
            ),
            Gap(ScreenSize.h12),
            SizedBox(
                width: double.maxFinite,
                child: Text(item!.description, textAlign: TextAlign.left))
          ],
         ),               
      ),
    );
  }
}
