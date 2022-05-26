part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthOtpSent extends AuthState {
  final String phone;
  AuthOtpSent({
    required this.phone,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AuthOtpSent && other.phone == phone;
  }

  @override
  int get hashCode => phone.hashCode;

  @override
  String toString() => 'AuthOtpSent(phone: $phone)';
}
