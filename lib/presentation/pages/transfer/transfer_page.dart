import 'package:agent_007/aplication/transfer/transfer_cubit.dart';
import 'package:agent_007/aplication/transfer/transfer_state.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'components/transfer_widget.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferCubit(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<TransferCubit>();
          final sizeWidth = MediaQuery.of(context).size.width;
          return BlocBuilder<TransferCubit, TransferState>(
              builder: (_, state) => Scaffold(
                    appBar: AppBar(
                        backgroundColor: AppTheme.colors.primary,
                        elevation: 0,
                        centerTitle: true,
                        title: Text("O'tkazmalar",
                            style: AppTheme.data.textTheme.displaySmall!
                                .copyWith(color: AppTheme.colors.secondary))),
                    body: Column(
                      children: [
                        TransferWidget1(
                            sizeWidth: sizeWidth,
                            animationSize1: cubit.animationSize1,
                            animationSize2: cubit.animationSize2,
                            ontap: (int id) =>
                                cubit.animationOntap(id, sizeWidth)),
                      ],
                    ),
                  ));
        },
      ),
    );
  }
}