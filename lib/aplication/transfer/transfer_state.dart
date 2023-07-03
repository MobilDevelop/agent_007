abstract class TransferState {
  const TransferState();
}

class TransferInitial extends TransferState {}

class TransferError extends TransferState {
  String message;
  TransferError(this.message);
}

class TransferSucces extends TransferState {
  String message;
  TransferSucces(this.message);
}
