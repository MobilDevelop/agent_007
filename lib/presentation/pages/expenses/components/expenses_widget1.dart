import 'package:agent_007/infrasutruktura/helper_method/helper_method.dart';
import 'package:agent_007/infrasutruktura/models/expenses/get_expenses.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ExpensesWidget1 extends StatelessWidget {
  const ExpensesWidget1({
    super.key,
    required this.ontap,
    required this.item,
    required this.controller,
  });
  final ExpensesInfo? item;
  final VoidCallback ontap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    if(item ==null){
      return const SizedBox.shrink();
    }
    return GestureDetector(
      onTap: () {
        controller.text =
            (double.parse(item!.amount) - double.parse(item!.payed)).toString();
        item!.paybtn
            ? AwesomeDialog(
                context: context,
                animType: AnimType.scale,
                dialogType: DialogType.infoReverse,
                body: Column(
                  children: [
                    Center(
                      child: Text(
                        tr('expenses.tolov'),
                        style: AppTheme.data.textTheme.displaySmall,
                      ),
                    ),
                    Gap(ScreenSize.h10),
                    Container(
                      height: 55.h,
                      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                      child: TextField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: false,
                        inputFormatters: [
                          MaskTextInputFormatter(
                              mask: '######################',
                              filter: {"#": RegExp(r'[0-9]')},
                              type: MaskAutoCompletionType.lazy)
                        ],
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 0),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                    color: AppTheme.colors.primary,
                                    width: 1.5)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                    color: AppTheme.colors.primary,
                                    width: 1.5))),
                      ),
                    ),
                    Gap(ScreenSize.h10)
                  ],
                ),
                btnCancelText: tr('transfer.cancel'),
                btnOkText: tr('transfer.ok'),
                btnOkOnPress: ontap,
                btnCancelOnPress: () {
                  controller.clear();
                }).show()
            : Container();
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(
          left: ScreenSize.w10,
          top: ScreenSize.h14,
          bottom: ScreenSize.h10,
          right: ScreenSize.w10,
        ),
        margin: EdgeInsets.symmetric(
            vertical: ScreenSize.h6, horizontal: ScreenSize.w10),
        decoration: BoxDecoration(
            color: AppTheme.colors.secondary,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
                color:
                    item!.paybtn ? AppTheme.colors.red : AppTheme.colors.primary,
                width: 2)),
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
                    Text(tr('expenses.narxi'),
                        style: AppTheme.data.textTheme.bodyLarge!
                            .copyWith(color: Colors.grey)),
                    Text(Helper.toProcessCost(item!.amount),
                        style: AppTheme.data.textTheme.displaySmall),
                  ],
                ),
                SvgPicture.asset(AppIcons.leftRight,
                    height: 20.h, color: Colors.grey),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(tr('expenses.tolangan'),
                        style: AppTheme.data.textTheme.bodyLarge!
                            .copyWith(color: Colors.grey)),
                    Text(Helper.toProcessCost(item!.payed),
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
                          color: item!.paybtn
                              ? AppTheme.colors.red
                              : AppTheme.colors.primary),
                    )
                  ],
                ),
                Text(item!.status,
                    style: AppTheme.data.textTheme.displaySmall),
              ],
            ),
            Gap(ScreenSize.h16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(tr('expenses.obyekt'),
                        style: AppTheme.data.textTheme.bodyLarge!
                            .copyWith(color: Colors.grey)),
                    Text(item!.location,
                        style: AppTheme.data.textTheme.displaySmall),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(tr('expenses.harajat'),
                        style: AppTheme.data.textTheme.bodyLarge!
                            .copyWith(color: Colors.grey)),
                    Text(item!.costtype,
                        style: AppTheme.data.textTheme.displaySmall),
                  ],
                ),
              ],
            ),
            Gap(ScreenSize.h16),
            DottedLine(
              dashColor: AppTheme.colors.gray,
            ),
            Gap(ScreenSize.h6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(tr('expenses.izoh'),
                    style: AppTheme.data.textTheme.bodyLarge!
                        .copyWith(color: Colors.grey)),
                Text(item!.name,
                    style: AppTheme.data.textTheme.labelSmall!
                        .copyWith(color: Colors.grey)),
              ],
            ),
            Gap(ScreenSize.h12),
            SizedBox(
                width: double.maxFinite,
                child: Text(item!.deskription, textAlign: TextAlign.left))
          ],
        ),
      ),
    );
  }
}
