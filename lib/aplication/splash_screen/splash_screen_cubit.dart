import 'package:agent_007/aplication/splash_screen/splash_screen_state.dart';
import 'package:agent_007/infrasutruktura/local_source/local_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(SplashScreenInitial()) {
    init();
  }

  void init() async {
    String type = await LocalSource.getInfo("token");
    String pass = await LocalSource.getInfo("pass");
    if(type.isNotEmpty){
       if(pass.isEmpty){
        emit(SplashScreenNextHome());
       }else{
        emit(SplashScreenNextSecret());
       }
       
    }else{
      emit(SplashScreenNextRegistration());
    }
  }
}
