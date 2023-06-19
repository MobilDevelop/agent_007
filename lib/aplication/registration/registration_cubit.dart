import 'package:agent_007/aplication/registration/registration_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationCubib extends Cubit<RegistrationState> {
  RegistrationCubib() : super(RegistrationInitial());

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  void sendInfo() async {
    String login = loginController.text.trim();
    String password = passwordController.text.trim();
    if (login.isEmpty || password.isEmpty) {
      print("no data");
    } else {}
  }
}
