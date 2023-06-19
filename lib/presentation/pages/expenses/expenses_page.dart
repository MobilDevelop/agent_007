import 'package:agent_007/aplication/expenses/expenses_cubit.dart';
import 'package:agent_007/aplication/expenses/expenses_state.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
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
          return BlocBuilder<ExpensesCubit, ExpensesState>(
              builder: (_, state) => Scaffold(
                    appBar: AppBar(
                        backgroundColor: AppTheme.colors.primary,
                        elevation: 0,
                        centerTitle: true,
                        title: Text("Xarajatlar",
                            style: AppTheme.data.textTheme.displaySmall!
                                .copyWith(color: AppTheme.colors.secondary))),
                    body: Container(
                      height: double.maxFinite,
                      width: double.maxFinite,
                      child: ListView.builder(
                          itemCount: 8,
                          itemBuilder: (context, index) => ExpensesWidget1(
                                ontap: () => cubit.activChoose(index),
                                inActive: cubit.activId == index,
                                height: cubit.height,
                              )),
                    ),
                    floatingActionButton: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: AppTheme.colors.primary,
                      child: const Icon(Icons.add),
                    ),
                  ));
        },
      ),
    );
  }
}
