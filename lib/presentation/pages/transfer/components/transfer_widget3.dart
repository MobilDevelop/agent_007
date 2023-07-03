import 'package:agent_007/infrasutruktura/models/universal_model/universal_model.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TransferWidget3 extends StatelessWidget {
  const TransferWidget3({
    super.key,
    required this.ontap,
    required this.amountController,
    required this.descriptionController,
    required this.allAgent,
    required this.selectAgent,
    required this.onChanged,
  });
  final VoidCallback ontap;
  final Function onChanged;
  final TextEditingController amountController;
  final TextEditingController descriptionController;
  final List<UniversalModel> allAgent;
  final UniversalModel? selectAgent;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.7,
      width: double.maxFinite,
      padding: EdgeInsets.only(
          top: ScreenSize.h8,
          left: size.width * 0.05,
          right: size.width * 0.05,
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
                  style: AppTheme.data.textTheme.displaySmall),
             Gap(ScreenSize.h16),     
                   DropdownSearch<UniversalModel>(
                mode: Mode.MENU,
                showSelectedItems: false,
                items: allAgent,
                dropdownSearchDecoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 17),
                    hintText: tr('transfer.agent'),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                            color: AppTheme.colors.primary, width: 1.5))),
                selectedItem: selectAgent,
                itemAsString: (UniversalModel? value) {
                  return value!.title.toString();
                },
                onChanged: (UniversalModel? value)=> onChanged(value),
              ),
              Gap(ScreenSize.h24),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                maxLines: 1,
                inputFormatters: [
                  MaskTextInputFormatter(
                      mask: '######################',
                      filter: {"#": RegExp(r'[0-9]')},
                      type: MaskAutoCompletionType.lazy)
                ],
                decoration: InputDecoration(
                    hintText: tr('transfer.amount'),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 17),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                            color: AppTheme.colors.primary, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                            color: AppTheme.colors.primary, width: 1.5))),
              ),
              Gap(ScreenSize.h24),
              TextField(
                controller: descriptionController,
                keyboardType: TextInputType.number,
                maxLines: 7,
                decoration: InputDecoration(
                    hintText: tr('transfer.izoh'),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                            color: AppTheme.colors.primary, width: 1.5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(
                            color: AppTheme.colors.primary, width: 1.5))),
              ),
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
                  width: size.width * 0.42,
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
                onPressed: (){
                  ontap();
                  Navigator.pop(context);
                },
                duration: const Duration(milliseconds: 150),
                child: Container(
                  height: 55.h,
                  width: size.width * 0.42,
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
