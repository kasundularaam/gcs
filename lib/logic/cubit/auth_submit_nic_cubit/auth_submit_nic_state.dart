part of 'auth_submit_nic_cubit.dart';

abstract class AuthSubmitNicState {}

class AuthSubmitNicInitial extends AuthSubmitNicState {}

class AuthSubmitNicLoading extends AuthSubmitNicState {}

class AuthSubmitNicSucceed extends AuthSubmitNicState {
  final String phone;
  AuthSubmitNicSucceed({
    required this.phone,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthSubmitNicSucceed && other.phone == phone;
  }

  @override
  int get hashCode => phone.hashCode;

  @override
  String toString() => 'AuthSubmitNicSucceed(phone: $phone)';
}

class AuthSubmitNicFailed extends AuthSubmitNicState {
  final String errorMsg;
  AuthSubmitNicFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthSubmitNicFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'AuthSubmitNicFailed(errorMsg: $errorMsg)';
}
