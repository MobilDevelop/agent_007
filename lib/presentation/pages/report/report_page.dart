

import 'package:agent_007/aplication/report/report_cubit.dart';
import 'package:agent_007/aplication/report/report_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ReportCubit(),
     child: Builder(
       builder: (context) {
        final cubit = context.read<ReportCubit>();
         return BlocListener<ReportCubit,ReportState>(listener: (context, state) {
            
         },
          child: BlocBuilder<ReportCubit,ReportState>(builder: (_, state) => const Scaffold(
            body:  Center(child: Text('Report page'),),
          )),
         );
       }
     ),
    );
  }
}