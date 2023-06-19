import 'package:agent_007/aplication/transfer/transfer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferCubit extends Cubit<TransferState> {
  TransferCubit() : super(TransferInitial());

  double animationSize1 = 0.0;
  double animationSize2 = 0.0;

  void animationOntap(int id, double width) {
    if (id == 1) {
      animationSize1 = width * 0.75;
      animationSize2 = width * 0.15;
    }
    if (id == 2) {
      animationSize2 = width * 0.75;
      animationSize1 = width * 0.15;
    }
    emit(TransferInitial());
  }
}
