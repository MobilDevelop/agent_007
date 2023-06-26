import 'package:agent_007/aplication/inputs/inputs_cubit.dart';
import 'package:agent_007/aplication/inputs/inputs_state.dart';
import 'package:agent_007/presentation/assets/theme/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputsPage extends StatelessWidget {
  const InputsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InputsCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<InputsCubit>();
          return BlocBuilder<InputsCubit, InputsState>(
              builder: (_, state) => Scaffold(
                    appBar: AppBar(
                        backgroundColor: AppTheme.colors.primary,
                        elevation: 0,
                        centerTitle: true,
                        title: Text(tr('inputs.title'),
                            style: AppTheme.data.textTheme.displaySmall!
                                .copyWith(color: AppTheme.colors.secondary))),
                  ));
        },
      ),
    );
  }
}
