import 'package:agent_007/aplication/dashboard/dashboard_cubit.dart';
import 'package:agent_007/aplication/dashboard/dashboard_state.dart';
import 'package:agent_007/presentation/assets/res/screen_size.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:agent_007/presentation/pages/home/components/home_widget1.dart';
import 'package:agent_007/presentation/pages/home/components/home_widget2.dart';
import 'package:agent_007/presentation/pages/home/components/home_widget3.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<DashboardCubit>();
          return BlocBuilder<DashboardCubit, DashboardState>(
              builder: (_, state) => Scaffold(
                    appBar: AppBar(
                        backgroundColor: AppTheme.colors.primary,
                        elevation: 0,
                        centerTitle: true,
                        title: Text(tr('dashboard.title'),
                            style: AppTheme.data.textTheme.displaySmall!
                                .copyWith(color: AppTheme.colors.secondary))),
                    body: Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                          bottom: ScreenSize.h12, top: ScreenSize.h8),
                      child: Column(
                        children: [
                          Expanded(flex: 1, child: HomeWidget1()),
                          Expanded(flex: 4, child: HomeWidget2()),
                          Expanded(
                              flex: 1,
                              child: HomeWidget3(
                                coast: '8 mln',
                                title: tr('dashboard.joriybalans'),
                              )),
                          Expanded(
                              flex: 1,
                              child: HomeWidget3(
                                coast: '2 mln',
                                title: tr('dashboard.xarajat'),
                              )),
                        ],
                      ),
                    ),
                  ));
        },
      ),
    );
  }
}
