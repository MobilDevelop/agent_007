import 'package:agent_007/aplication/transfer/transfer_cubit.dart';
import 'package:agent_007/aplication/transfer/transfer_state.dart';
import 'package:agent_007/infrasutruktura/models/universal_model/universal_model.dart';
import 'package:agent_007/presentation/assets/asset_index.dart';
import 'package:agent_007/presentation/pages/animation_loading/loading.dart';
import 'package:agent_007/presentation/pages/transfer/components/transfer_widget2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/transfer_widget.dart';
import 'components/transfer_widget3.dart';

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
          return BlocListener<TransferCubit, TransferState>(
            listener: (context, state) {
              if (state is TransferSucces) {
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
              } else if (state is TransferError) {
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
            child: BlocBuilder<TransferCubit, TransferState>(
                builder: (_, state) => Stack(
                      children: [
                        Scaffold(
                          appBar: AppBar(
                              backgroundColor: AppTheme.colors.primary,
                              elevation: 0,
                              centerTitle: true,
                              title: Text("O'tkazmalar",
                                  style: AppTheme.data.textTheme.displaySmall!
                                      .copyWith(
                                          color: AppTheme.colors.secondary))),
                          body: Column(
                            children: [
                              TransferWidget1(
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
                                      cubit.getAllItems();
                                      return false;
                                    }
                                    return true;
                                  },
                                  child: ListView.builder(
                                      itemCount: cubit.items.length,
                                      itemBuilder: (_, index) => TransferWidget2(
                                           ontapCancel: cubit.cancellation,
                                          ontapConfirm: cubit.confirmation,
                                          item: cubit.check(index), 
                                         )),
                                ),
                              )
                            ],
                          ),
                          floatingActionButton: FloatingActionButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                isScrollControlled: true,
                                enableDrag: true,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => TransferWidget3(
                                        ontap: cubit.moneyTransfer,
                                        onChanged:(UniversalModel? model)=> cubit.select(model),
                                        allAgent: cubit.allAgent,
                                        amountController: cubit.amountController,
                                        descriptionController:
                                            cubit.descriptionController,
                                        selectAgent: cubit.selectAgent,
                                      ));
                            },
                            backgroundColor: AppTheme.colors.primary,
                            child: const Icon(Icons.add),
                          ),
                        ),
                        Visibility(visible: cubit.loading, child: const Loading())
                      ],
                    )),
          );
        },
      ),
    );
  }
}
