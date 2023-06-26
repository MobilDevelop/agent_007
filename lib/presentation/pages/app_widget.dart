import 'package:agent_007/aplication/app_manager/app_manager_cubit.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:agent_007/presentation/components/error_view.dart';
import 'package:agent_007/presentation/routes/coordinator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:requests_inspector/requests_inspector.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppManagerCubit, AppManagerState>(
        builder: (context, state) {
      if (state is AppManagerLoading) {
        return const CircularProgressIndicator();
      } else if (state is AppManagerError) {
        return ErrorView(error: state.error);
      } else {
        return RequestsInspector(
          // enabled: PlatformInfo.isDebugMode,
          showInspectorOn: ShowInspectorOn.LongPress,
          child: MaterialApp.router(
            title: 'Agent007',
            theme: AppTheme.data,
            themeMode: AppTheme.themeMode,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            routerDelegate: router.routerDelegate,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: child ??
                    const Material(
                      color: Colors.white,
                      child: SizedBox(),
                    ),
              );
            },
          ),
        );
      }
    });
  }
}
