import 'package:agent_007/aplication/expenses/expenses_cubit.dart';
import 'package:agent_007/aplication/expenses/expenses_state.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:agent_007/presentation/pages/animation_loading/loading.dart';
import 'package:agent_007/presentation/pages/expenses/components/expenses_widget2.dart';
import 'package:agent_007/presentation/routes/index_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/expenses_widget1.dart';

class ExpensesPage extends StatelessWidget {
  const ExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpensesCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<ExpensesCubit>();
           final sizeWidth = MediaQuery.of(context).size.width;
          return BlocListener<ExpensesCubit, ExpensesState>(
            listener: (context, state) {
              if (state is ExpensesSucces) {
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
              } else if (state is ExpensesError) {
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
            child: BlocBuilder<ExpensesCubit, ExpensesState>(
                builder: (_, state) => Scaffold(
                      appBar: AppBar(
                        backgroundColor: AppTheme.colors.primary,
                        elevation: 0,
                        centerTitle: true,
                        title: Text(tr('expenses.title'),
                            style: AppTheme.data.textTheme.displaySmall!
                                .copyWith(color: AppTheme.colors.secondary)),
                      ),
                      body: Stack(
                        children: [
                          Column(
                            children: [
                               ExpensesWidget2(
                                  sizeWidth: sizeWidth,
                                  animationSize1: cubit.animationSize1,
                                  animationSize2: cubit.animationSize2,
                                  ontap: (int id) =>
                                      cubit.animationOntap(id, sizeWidth)),
                              Expanded(
                                child: NotificationListener<ScrollNotification>(
                                  onNotification: (notification) {
                                    if (notification.metrics.pixels ==
                                        notification.metrics.maxScrollExtent&&!cubit.loading) {
                                      cubit.init();
                                      return false;
                                    }
                                    return true;
                                  },
                                  child: ListView.builder(
                                      controller: cubit.scrollController,
                                      itemCount: cubit.items.length,
                                      itemBuilder: (context, index) =>
                                          ExpensesWidget1(
                                            ontap: () => cubit
                                                .payment(cubit.items[index].id),
                                            item: cubit.check(index),
                                            controller: cubit.paymentController,
                                          )),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                              visible: cubit.loading, child: const Loading())
                        ],
                      ),
                      floatingActionButton: FloatingActionButton(
                        onPressed: () {
                          context
                              .push(Routes.addexpenses.path)
                              .then((value){
                                cubit.pagination=1;
                                cubit.paginationCheck =true;
                                cubit.items.clear();
                                cubit.init();});
                        },
                        backgroundColor: AppTheme.colors.primary,
                        child: const Icon(Icons.add),
                      ),
                    )),
          );
        },
      ),
    );
  }
}
