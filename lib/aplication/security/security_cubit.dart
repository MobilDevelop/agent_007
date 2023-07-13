import 'package:agent_007/aplication/security/security_state.dart';
import 'package:agent_007/infrasutruktura/local_source/local_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

class SecurityCubit extends Cubit<SecurityState>{
  SecurityCubit(String type):super(SecurityInitial()){
    init();
  }
  

  String index = "";
  final controller = TextEditingController();
  bool loading = false;
  String succes ='';
  final LocalAuthentication auth = LocalAuthentication();


  void init()async{
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =  canAuthenticateWithBiometrics || await auth.isDeviceSupported();
    succes =await LocalSource.getInfo('pass');
   
    emit(SecurityInitial());
   
  }


    

    chooseType(String type){
      if(type.isEmpty){
        onCheck();
      }else{
        onEdit();
      }
    }


   void onCheck(){
    loading = true;
    emit(SecurityInitial());
    if(index.length==succes.length){
      if(index==succes){
    emit(SecurityNextHome());
    }else{
      loading =false;
      index='';
      controller.clear();
      emit(SecurityError("Parol noto'g'ri kiritildi"));
    }
    }else{
      loading =false;
      index='';
      controller.clear();
      emit(SecurityError("Parol noto'g'ri kiritildi"));
    }
   }


   onEdit(){
      loading =true;
      emit(SecurityInitial());
      if(index.length>=4){
       LocalSource.putInfo("pass", index);
       emit(SecuritySucces());
      }else{
        loading=false;
        emit(SecurityError("Parol uzunligi 4 tadan kam bo'lmasligi kerak"));
      }
   }


   void onInput(String value) {
    if (index.length < 6) {
      if (index.isEmpty) {
          index = value;
          controller.text = index;
      } else {
          index = index + value;
          controller.text = index; 
      }
    }
    emit(SecurityInitial());
  }

  void onDelete() {
    if(index.isNotEmpty){
    index = index.substring(0, index.length - 1);
    controller.text = index;
    emit(SecurityInitial());
    }
  }

  void onAllDelete() {
    controller.text = "";
    index = "";
    emit(SecurityInitial());
  }

}
