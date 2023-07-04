import 'package:agent_007/aplication/settings/settings_state.dart';
import 'package:agent_007/infrasutruktura/local_source/local_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingInitial()){
    init();
  }
   
   bool check1=false;
   bool check2=false;

   bool showEdit= false;

  void init()async{
    String edit = await LocalSource.getInfo('pass');
    String finger = await LocalSource.getInfo('finger');
    if(edit.isNotEmpty){
      showEdit=true;
      check1=true;
    }else{
      showEdit=false;
      check1=false;
    }
    if(finger.isNotEmpty){
      check2=true;
    }else{
      check2=false;
    }
    emit(SettingInitial());
  }

  void checked1(){
    check1=!check1;
    if(check1){
      LocalSource.putInfo("pass", "pass");
    }else{
      LocalSource.putInfo("pass", "");
    }
   init();
  }

  void checked2(){
    check2=!check2;
    if(check2){
      LocalSource.putInfo("finger", "finger");
    }else{
      LocalSource.putInfo("finger", "");
    }
   init();
  }
}
