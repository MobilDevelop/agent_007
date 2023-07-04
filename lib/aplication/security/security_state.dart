abstract class SecurityState{
  const SecurityState();
}

class SecurityInitial extends SecurityState{}


class SecurityNextHome extends SecurityState{}


class SecurityError extends SecurityState{
  String message;
  SecurityError(this.message);
}