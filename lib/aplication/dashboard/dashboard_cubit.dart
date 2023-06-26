import 'package:agent_007/aplication/dashboard/dashboard_state.dart';
import 'package:agent_007/domain/provider/dashboard.dart';
import 'package:agent_007/infrasutruktura/models/dashboard/dashboard_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial()){
    init();
  }

 
 void init()async{
  DashboardModel model = await DashboardService().registration();
  print(model);
 }

}
