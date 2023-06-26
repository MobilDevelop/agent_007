import 'package:agent_007/aplication/registration/registration_cubit.dart';
import 'package:agent_007/aplication/registration/registration_state.dart';
import 'package:agent_007/presentation/assets/res/screen_size.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:agent_007/presentation/components/button/main_button.dart';
import 'package:agent_007/presentation/pages/animation_loading/loading.dart';
import 'package:agent_007/presentation/routes/entity/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = context.read<RegistrationCubib>();

      return BlocListener<RegistrationCubib,RegistrationState>(listener: (context, state) {
         if(state is RegistrationIsEmpty){
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
       }else if(state is RegistrationNextHome){
        context.go(Routes.home.path);
       }
      },
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.white,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: ScreenSize.w18),
            child: SingleChildScrollView(
                child: Column(
              children: [
                Text("Shaxsiy",
                    style: AppTheme.data.textTheme.headlineSmall!
                        .copyWith(color: AppTheme.colors.black)),
                Text("ma‘lumotlaringizni kiriting!",
                    style: AppTheme.data.textTheme.headlineSmall!
                        .copyWith(color: AppTheme.colors.black)),
                Gap(50.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Login",
                      style: AppTheme.data.textTheme.bodyLarge!
                          .copyWith(color: AppTheme.colors.black),
                    ),
                    Gap(ScreenSize.h6),
                    TextField(
                      controller: cubit.loginController,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 18.h, horizontal: ScreenSize.w10),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  width: 1.5, color: AppTheme.colors.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  width: 1.5, color: AppTheme.colors.primary))),
                    )
                  ],
                ),
                Gap(30.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Parol",
                      style: AppTheme.data.textTheme.bodyLarge!
                          .copyWith(color: AppTheme.colors.black),
                    ),
                    Gap(ScreenSize.h6),
                    TextField(
                      controller: cubit.passwordController,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppTheme.colors.black),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 18.h, horizontal: ScreenSize.w10),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  width: 1.5, color: AppTheme.colors.primary)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                  width: 1.5, color: AppTheme.colors.primary))),
                    )
                  ],
                ),
                Gap(80.h),
                MainButton(
                    text: "Tasdiqlash", onPressed: () => cubit.sendInfo())
              ],
            )),
          ),
          const Visibility(visible: false, child: Loading())
        ],
      ))
      );
    });
  }
}
