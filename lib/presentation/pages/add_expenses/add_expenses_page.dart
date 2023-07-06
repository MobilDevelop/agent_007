import 'package:agent_007/aplication/add_expenses/add_expenses_cubit.dart';
import 'package:agent_007/aplication/add_expenses/add_expenses_state.dart';
import 'package:agent_007/infrasutruktura/models/universal_model/universal_model.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:gap/gap.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AddExpensesPage extends StatelessWidget {
  const AddExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = context.read<AddExpensesCubit>();
       cubit.init();
      return BlocListener<AddExpensesCubit,AddExpensesState>(
        listener: (context, state) {
          if(state is EmptyInfo){
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppTheme.colors.primary,
              content: Text(
                state.message,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
          }else if(state is SuccesInfo){
            Navigator.pop(context);
          }
        },
        child: BlocBuilder<AddExpensesCubit, AddExpensesState>(
            builder: (context, state) => Scaffold(
                  appBar: AppBar(
                      backgroundColor: AppTheme.colors.primary,
                      elevation: 0,
                      centerTitle: true,
                      title: Text(tr('addexpenses.title'),
                          style: AppTheme.data.textTheme.displaySmall!
                              .copyWith(color: AppTheme.colors.secondary))),
                  body: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: ScreenSize.h16,horizontal: ScreenSize.w12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            DropdownSearch<UniversalModel>(
                              mode: Mode.MENU,
                              showSelectedItems: false,
                              items: cubit.locationItems,
                              dropdownSearchDecoration:  InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 17),
                                  hintText: tr('addexpenses.obyekt'),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      color: AppTheme.colors.primary,
                                      width: 1.5
                                    )
                                  )),
                              selectedItem: cubit.location,
                              itemAsString: (UniversalModel? value) {
                                return value!.title.toString();
                              },
                              onChanged: (value) {
                                cubit.location = value;
                              },
                            ),
                           Gap(ScreenSize.h24),
                            DropdownSearch<UniversalModel>(
                              mode: Mode.MENU,
                              showSelectedItems: false,
                              items: cubit.costTypeItems,
                              dropdownSearchDecoration:  InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 17),
                                  hintText: tr('addexpenses.harajat'),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                      color: AppTheme.colors.primary,
                                      width: 1.5
                                    )
                                  )),
                              selectedItem: cubit.costType,
                              itemAsString: (UniversalModel? value) {
                                return value!.title.toString();
                              },
                              onChanged: (value) {
                                cubit.costType = value;
                              },
                            ), 
                            Gap(ScreenSize.h24),
                            TextField(
                        controller: cubit.paymentController,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: false,
                        maxLines: 1,   
                        inputFormatters: [
                         MaskTextInputFormatter(
                         mask: '######################', 
                         filter: { "#": RegExp(r'[0-9]') },
                         type: MaskAutoCompletionType.lazy)
                        ],
                        decoration: InputDecoration(
                          hintText: tr('addexpenses.narxi'),
                          contentPadding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 17),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: AppTheme.colors.primary,
                              width: 1.5
                            )
                          ),
                         focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: AppTheme.colors.primary,
                              width: 1.5
                            )
                          ) 
                        ),
                      ),
                            Gap(ScreenSize.h24),
                      TextField(
                        controller: cubit.commitController,
                        enableInteractiveSelection: false,
                        maxLines: 7,
                        decoration: InputDecoration(
                          hintText: tr('addexpenses.izoh'),
                          contentPadding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: AppTheme.colors.primary,
                              width: 1.5
                            )
                          ),
                         focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            borderSide: BorderSide(
                              color: AppTheme.colors.primary,
                              width: 1.5
                            )
                          ) 
                        ),
                      ),  
                          ]
                        ),    
                             f_bounce.Bounce(
                               onPressed: cubit.add,
                               duration: const Duration(milliseconds: 150),
                               child: Container(
                                 height: 55.h,
                                 width: double.maxFinite,
                                 alignment: Alignment.center,
                                 decoration: BoxDecoration(
                                   color: AppTheme.colors.green,
                                   borderRadius: BorderRadius.circular(18.r)),
                                 child: Text(tr('transfer.ok'),
                                   style: AppTheme.data.textTheme.displayLarge!
                                       .copyWith(color: AppTheme.colors.secondary)),
                               ),
                             )
                      ],
                    ),
                  ),
                )),
      );
    });
  }
}
