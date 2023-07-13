import 'package:agent_007/aplication/settings/settings_cubit.dart';
import 'package:agent_007/aplication/settings/settings_state.dart';
import 'package:agent_007/infrasutruktura/local_source/local_source.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:agent_007/presentation/routes/index_routes.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;
import 'package:gap/gap.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<SettingsCubit>();
        return BlocListener<SettingsCubit, SettingsState>(
          listener: (context, state) {
             if(state is SettingNextEdit){
              context.push(Routes.security.path,extra: "new");
             }
          },
          child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (_, state) => Scaffold(
                    appBar: AppBar(
                        backgroundColor: AppTheme.colors.primary,
                        elevation: 0,
                        centerTitle: true,
                        title: Text(tr('settings.title'),
                            style: AppTheme.data.textTheme.displaySmall!
                                .copyWith(color: AppTheme.colors.secondary))),
                    body:  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: 70.h,
                              width: double.maxFinite,
                              padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(tr('setting.password')),
                                  Switch(
                                    value: cubit.check1,
                                    activeColor: AppTheme.colors.primary,
                                    onChanged: (value)=>cubit.checked1())
                                ],
                              ),
                            ),
                            Container(
                              height: 1.h,
                              width: double.maxFinite,
                              color: AppTheme.colors.gray,
                            ),
                            // Visibility(
                            //   visible: cubit.showEdit,
                            //   child: Column(
                            //     children: [
                            //       f_bounce.Bounce(
                            //           duration: const Duration(milliseconds: 150),
                            //           onPressed: (){},
                            //         child: Container(
                            //              height: 70.h,
                            //              width: double.maxFinite,
                            //             alignment: Alignment.centerLeft,
                            //            padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                            //              child: Text(tr('setting.edit'))),
                            //       ),
                            //    Container(
                            //     height: 1.h,
                            //     width: double.maxFinite,
                            //     color: AppTheme.colors.gray,
                            //   ),
                            //     ],
                            //   ),
                            // ),
                            Container(
                              height: 70.h,
                              width: double.maxFinite,
                              padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(tr('setting.biometrik')),
                                  Switch(
                                    value: cubit.check2, 
                                     activeColor: AppTheme.colors.primary,
                                    onChanged: (value)=>cubit.checked2())
                                ],
                              ),
                            ),
                             Container(
                              height: 1.h,
                              width: double.maxFinite,
                              color: AppTheme.colors.gray,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            f_bounce.Bounce(
                              duration: const Duration(milliseconds: 150),
                              onPressed: (){
                                AwesomeDialog(
                        context: context,
                        animType: AnimType.scale,
                        dialogType: DialogType.infoReverse,
                        body: Center(
                          child: Text(
                            tr('universal.close'),
                            textAlign: TextAlign.center,
                            style: AppTheme.data.textTheme.displaySmall,
                          ),
                        ),
                        btnCancelText: tr('universal.yoq'),
                        btnOkText: tr('universal.ha'),
                        btnOkOnPress: (){
                         LocalSource.clearProfile();
                         context.go(Routes.registration.path);
                        },
                        btnCancelOnPress: () {
                       
                        })
                    .show();
                              },
                              child: Container(
                                                  height: 50.h,
                                                  width: double.maxFinite,
                                                  margin: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                                                  decoration: BoxDecoration(
                              color: AppTheme.colors.red,
                              borderRadius: BorderRadius.circular(18.r)
                                                  ),
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                                                  child: Text(tr('setting.close'),style: AppTheme.data.textTheme.headlineMedium!.copyWith(color: AppTheme.colors.secondary),),
                                                ),
                            ),
                         Gap(ScreenSize.h10)
                          ],
                        ),
                      ],
                    ),            
                  )),
        );
      }),
    );
  }
}
