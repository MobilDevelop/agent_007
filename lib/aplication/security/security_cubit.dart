import 'package:agent_007/aplication/security/security_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecurityCubit extends Cubit<SecurityState>{
  SecurityCubit():super(SecurityInitial());

  String index = "";
  final controller = TextEditingController();
  bool loading = false;


   void onCheck(){
    loading = true;
    emit(SecurityInitial());
    if(index.length>5){
      if(index=="123456"){
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