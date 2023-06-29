import 'package:agent_007/aplication/registration/registration_state.dart';
import 'package:agent_007/domain/provider/registration.dart';
import 'package:agent_007/infrasutruktura/models/registration/registration_send.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationCubib extends Cubit<RegistrationState> {
  RegistrationCubib() : super(RegistrationInitial());

  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;


  void sendInfo() async {
    String login = loginController.text.trim();
    String password = passwordController.text.trim();
    if (login.isEmpty || password.isEmpty) {
     emit(const RegistrationIsEmpty("ma'lumotlarni to'ldiring"));
    } else {
      loading =true;
      emit(RegistrationInitial());
      Registration registration = Registration(login: login,parol: password);
      bool check = await RegistrationService().registration(registration);
      if(check){emit(RegistrationNextHome());}else{
        loading=false;
        emit(const RegistrationIsEmpty("server error"));
      } 
      

    }
  }
}
