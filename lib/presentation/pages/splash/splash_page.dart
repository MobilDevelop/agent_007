import 'package:agent_007/aplication/splash_screen/splash_screen_cubit.dart';
import 'package:agent_007/aplication/splash_screen/splash_screen_state.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:agent_007/presentation/routes/entity/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit(),
      child: BlocListener<SplashScreenCubit,SplashScreenState>(listener: (context, state) {
         if(state is SplashScreenNextHome){
          context.go(Routes.home.path);
         }else if(state is SplashScreenNextRegistration){
          context.go(Routes.registration.path);
         }
      },
       child: Builder(
        builder: (context) {
          final cubit = context.read<SplashScreenCubit>();
          return BlocBuilder<SplashScreenCubit, SplashScreenState>(
              builder: (context, state) => Scaffold(
                    backgroundColor: AppTheme.colors.primary,
                    body: Container(
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.only(bottom: ScreenSize.h20),
                      child: Text(
                        "Agent007",
                        style: AppTheme.data.textTheme.displaySmall!
                            .copyWith(color: AppTheme.colors.secondary),
                      ),
                    ),
                  ));
        },
      )
      )
    );
  }
}
