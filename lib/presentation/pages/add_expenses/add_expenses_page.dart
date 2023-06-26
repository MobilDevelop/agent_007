import 'package:agent_007/aplication/add_transfer/add_expenses_cubit.dart';
import 'package:agent_007/aplication/add_transfer/add_expenses_state.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExpensesPage extends StatelessWidget {
  const AddExpensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final cubit = context.read<AddExpensesCubit>();
      return BlocBuilder<AddExpensesCubit, AddExpensesState>(
          builder: (context, state) => Scaffold(
                appBar: AppBar(
                    backgroundColor: AppTheme.colors.primary,
                    elevation: 0,
                    centerTitle: true,
                    title: Text(tr('addexpenses.title'),
                        style: AppTheme.data.textTheme.displaySmall!
                            .copyWith(color: AppTheme.colors.secondary))),
                body: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [],
                    ),
                  ),
                ),
              ));
    });
  }
}
