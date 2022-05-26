part of 'auth_submit_otp_cubit.dart';

abstract class AuthSubmitOtpState {}

class AuthSubmitOtpInitial extends AuthSubmitOtpState {}

class AuthSubmitOtpLoading extends AuthSubmitOtpState {}

class AuthSubmitOtpSucceed extends AuthSubmitOtpState {}

class AuthSubmitOtpFailed extends AuthSubmitOtpState {
  final String errorMsg;
  AuthSubmitOtpFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthSubmitOtpFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'AuthSubmitOtpFailed(errorMsg: $errorMsg)';
}
