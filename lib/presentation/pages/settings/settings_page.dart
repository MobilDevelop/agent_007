import 'dart:ui';

import 'package:agent_007/aplication/settings/settings_cubit.dart';
import 'package:agent_007/aplication/settings/settings_state.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
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
          builder: (_, state) => Stack(
            children: [
              Scaffold(
                    appBar: AppBar(
                        backgroundColor: AppTheme.colors.primary,
                        elevation: 0,
                        centerTitle: true,
                        title: Text(tr('settings.title'),
                            style: AppTheme.data.textTheme.displaySmall!
                                .copyWith(color: AppTheme.colors.secondary))),
                  ),
               ClipRect(
                child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: const Center(
                  child:  Text("Tez orada ishga tushadi"),
                ),
                ),
               )   
            ],
          ));
    });
  }
}
