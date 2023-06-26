abstract class RegistrationState {
  const RegistrationState();
}

class RegistrationInitial extends RegistrationState {}

class RegistrationIsEmpty extends RegistrationState {
  final String message;

  const RegistrationIsEmpty(this.message);
}

class RegistrationNextHome extends RegistrationState{}
