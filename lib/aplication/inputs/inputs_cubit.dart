import 'package:agent_007/aplication/inputs/inputs_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InputsCubit extends Cubit<InputsState> {
  InputsCubit() : super(InputsInitial());
}
