import 'dart:ui';

import 'package:agent_007/aplication/settings/settings_cubit.dart';
import 'package:agent_007/aplication/settings/settings_state.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = context.read<SettingsCubit>();
      return BlocBuilder<SettingsCubit, SettingsState>(
          builder: (_, state) => Scaffold(
                appBar: AppBar(
                    backgroundColor: AppTheme.colors.primary,
                    elevation: 0,
                    centerTitle: true,
                    title: Text(tr('settings.title'),
                        style: AppTheme.data.textTheme.displaySmall!
                            .copyWith(color: AppTheme.colors.secondary))),
                body:  Column(
                  children: [
                    Container(
                      height: 70.h,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Parol bilan kirish'),
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
                    Visibility(
                      visible: cubit.showEdit,
                      child: Column(
                        children: [
                          Container(
                        height: 70.h,
                        width: double.maxFinite,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                        child: Text("Parolni o'zgartirish"),
                      ),
                       Container(
                        height: 1.h,
                        width: double.maxFinite,
                        color: AppTheme.colors.gray,
                      ),
                        ],
                      ),
                    ),
                    Container(
                      height: 70.h,
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(horizontal: ScreenSize.w10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Biometrik malumotlar bilan kirish'),
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
              ));
    });
  }
}
