import 'package:agent_007/aplication/security/security_cubit.dart';
import 'package:agent_007/aplication/security/security_state.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:agent_007/presentation/pages/animation_loading/loading.dart';
import 'package:agent_007/presentation/routes/entity/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as f_bounce;
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'components/security_widget.dart';

class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => SecurityCubit(),
     child:  BlocListener<SecurityCubit,SecurityState>(
      listener: (context, state) {
        if(state is SecurityNextHome){
          context.go(Routes.home.path);
        }else if(state is SecurityError){
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
        }
      },
       child: Builder(builder: (context) {
         final cubit = context.read<SecurityCubit>();
         return BlocBuilder<SecurityCubit,SecurityState>(builder: (_, state) => 
         Scaffold(
            backgroundColor: AppTheme.colors.background,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppTheme.colors.background,
              centerTitle: true,
              title:Text("Parolni kiriting",style: AppTheme.data.textTheme.displaySmall!
                                  .copyWith(color: AppTheme.colors.primary)),
            ),
            body: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding:
                            EdgeInsets.only(left: ScreenSize.w10, right: ScreenSize.w6, bottom: ScreenSize.h32),
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: 65.h,
                          child: Stack(
                            children: [
                               Directionality(
                                textDirection: TextDirection.rtl,
                                child: TextField(
                                  controller: cubit.controller,
                                  enabled: false,
                                  textAlign: TextAlign.center,
                                  style:  TextStyle(
                                      color: AppTheme.colors.primary,
                                      letterSpacing: 5,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 50),
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: cubit.index.isNotEmpty,
                                child: Positioned(
                                    child: Container(
                                  height: 55.h,
                                  width: double.infinity,
                                  alignment: Alignment.bottomRight,
                                  child: GestureDetector(
                                    onLongPress:cubit.onAllDelete,
                                    child: IconButton(
                                        onPressed: cubit.onDelete,
                                        icon: Icon(Icons.backspace,
                                            color: AppTheme.colors.primary
                                                )),
                                  ),
                                )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ScreenSize.w10,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("1"), title: '1',)),
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("2"), title: '2',)),
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("3"), title: '3',)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("4"), title: '4',)),
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("5"), title: '5',)),
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("6"), title: '6',)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("7"), title: '7',)),
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("8"), title: '8',)),
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("9"), title: '9',)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("A"), title: 'A',)),
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("0"), title: '0',)),
                                  Expanded(child: SecurityWidget(onPress: ()=>cubit.onInput("B"), title: 'B',)),
                                   ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          padding: EdgeInsets.symmetric(horizontal: ScreenSize.w20),
                          child: f_bounce.Bounce(
                           duration: const Duration(milliseconds: 150),
                            onPressed:()=>cubit.onCheck(),
                            child: Container(
                              height: 60,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.r),
                                  color: AppTheme.colors.primary
                                      ),
                              child: Text(
                                "Tasdiqlash",
                                style: AppTheme.data.textTheme.displaySmall!.copyWith(color: AppTheme.colors.secondary),
                              ),
                            ),
                          ),
                        )),
                    Gap(ScreenSize.h32)
                  ],
                ),
                Visibility(visible: cubit.loading, child: const Loading())
              ],
            ),
          ),
        
         );
       
       }
       ),
     ));
     }
}


