import 'package:agent_007/aplication/home/home_cubit.dart';
import 'package:agent_007/aplication/home/home_state.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(builder: (context) {
        final cubit = context.read<HomeCubit>();
        return BlocBuilder<HomeCubit, HomeState>(
            builder: (_, state) => Scaffold(
                backgroundColor: AppTheme.colors.gray100,
                body: cubit.windows[cubit.currentIndex],
                bottomNavigationBar: SalomonBottomBar(
                    currentIndex: cubit.currentIndex,
                    onTap: (i) => cubit.nextPage(i),
                    backgroundColor: AppTheme.colors.primary.withOpacity(0.05),
                    duration: const Duration(milliseconds: 1600),
                    items: salomonBar(cubit.model?.status=='admin'))));
      }),
    );
  }


   List<SalomonBottomBarItem> salomonBar(bool check){
     if(check){
      return [
            /// Dashboard
         SalomonBottomBarItem(
                          icon: SvgPicture.asset(
                            AppIcons.home,
                            height: 25.h,
                          ),
                          title: Text(tr('dashboard.title')),
                          selectedColor: AppTheme.colors.primary,
                          activeIcon: SvgPicture.asset(
                            AppIcons.home,
                            color: AppTheme.colors.primary,
                            height: 35.h,
                          )),

                      /// Expenses
                      SalomonBottomBarItem(
                          icon: SvgPicture.asset(
                            AppIcons.cost,
                            height: 25.h,
                          ),
                          title: Text(tr('expenses.title')),
                          selectedColor: AppTheme.colors.primary,
                          activeIcon: SvgPicture.asset(
                            AppIcons.cost,
                            color: AppTheme.colors.primary,
                            height: 35.h,
                          )),
                     
                       /// Transfer
                      SalomonBottomBarItem(
                          icon: SvgPicture.asset(
                            AppIcons.transfer,
                            height: 25.h,
                          ),
                          title: Text(tr('transfer.title')),
                          selectedColor: AppTheme.colors.primary,
                          activeIcon: SvgPicture.asset(
                            AppIcons.transfer,
                            color: AppTheme.colors.primary,
                            height: 35.h,
                          )),

                         /// Report
                     SalomonBottomBarItem(
                          icon: SvgPicture.asset(
                            AppIcons.report,
                            height: 25.h,
                          ),
                          title: Text(tr('report.title')),
                          selectedColor: AppTheme.colors.primary,
                          activeIcon: SvgPicture.asset(
                            AppIcons.report,
                            color: AppTheme.colors.primary,
                            height: 35.h,
                          )),    

                      /// Setting
                      SalomonBottomBarItem(
                        icon: SvgPicture.asset(
                          AppIcons.setting,
                          height: 25.h,
                        ),
                        title: Text(tr('settings.title')),
                        activeIcon: SvgPicture.asset(
                          AppIcons.setting,
                          color: AppTheme.colors.primary,
                          height: 35.h,
                        ),
                        selectedColor: AppTheme.colors.primary,
                      ),
      ];
     }
     return [
            SalomonBottomBarItem(
                          icon: SvgPicture.asset(
                            AppIcons.home,
                            height: 25.h,
                          ),
                          title: Text(tr('dashboard.title')),
                          selectedColor: AppTheme.colors.primary,
                          activeIcon: SvgPicture.asset(
                            AppIcons.home,
                            color: AppTheme.colors.primary,
                            height: 35.h,
                          )),

                      /// Expenses
                      SalomonBottomBarItem(
                          icon: SvgPicture.asset(
                            AppIcons.cost,
                            height: 25.h,
                          ),
                          title: Text(tr('expenses.title')),
                          selectedColor: AppTheme.colors.primary,
                          activeIcon: SvgPicture.asset(
                            AppIcons.cost,
                            color: AppTheme.colors.primary,
                            height: 35.h,
                          )),
                     
                       /// Transfer
                      SalomonBottomBarItem(
                          icon: SvgPicture.asset(
                            AppIcons.transfer,
                            height: 25.h,
                          ),
                          title: Text(tr('transfer.title')),
                          selectedColor: AppTheme.colors.primary,
                          activeIcon: SvgPicture.asset(
                            AppIcons.transfer,
                            color: AppTheme.colors.primary,
                            height: 35.h,
                          )),
 
                      /// Setting
                      SalomonBottomBarItem(
                        icon: SvgPicture.asset(
                          AppIcons.setting,
                          height: 25.h,
                        ),
                        title: Text(tr('settings.title')),
                        activeIcon: SvgPicture.asset(
                          AppIcons.setting,
                          color: AppTheme.colors.primary,
                          height: 35.h,
                        ),
                        selectedColor: AppTheme.colors.primary,
                      ),];
  }
}