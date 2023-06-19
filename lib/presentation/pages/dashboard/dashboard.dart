import 'package:agent_007/presentation/assets/res/screen_size.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:agent_007/presentation/pages/home/components/home_widget1.dart';
import 'package:agent_007/presentation/pages/home/components/home_widget2.dart';
import 'package:agent_007/presentation/pages/home/components/home_widget3.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
              backgroundColor: AppTheme.colors.primary,
              elevation: 0,
              centerTitle: true,
              title: Text("Dashboard",
                  style: AppTheme.data.textTheme.displaySmall!
                      .copyWith(color: AppTheme.colors.secondary))),
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            padding:
                EdgeInsets.only(bottom: ScreenSize.h12, top: ScreenSize.h8),
            child: Column(
              children: [
                Expanded(flex: 1, child: HomeWidget1()),
                Expanded(flex: 4, child: HomeWidget2()),
                Expanded(
                    flex: 1,
                    child: HomeWidget3(
                      coast: '8 mln',
                      title: "Joriy balans:",
                    )),
                Expanded(
                    flex: 1,
                    child: HomeWidget3(
                      coast: '2 mln',
                      title: 'Xarajatlar:',
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
