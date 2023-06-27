import 'package:agent_007/aplication/dashboard/dashboard_state.dart';
import 'package:agent_007/domain/provider/dashboard.dart';
import 'package:agent_007/infrasutruktura/models/dashboard/dashboard_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial()){
    init();
  } 
  DashboardModel model =DashboardModel(allPrice: '0.0', currentBalans: '1.0', expenses: '0.0', name: '');
  
  bool loading =true;


 
 void init()async{
   model = await DashboardService().registration();
   loading =false;
   emit(DashboardInitial());
 }

}
