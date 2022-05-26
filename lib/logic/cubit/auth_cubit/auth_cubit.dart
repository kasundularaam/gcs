import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  initial() => emit(AuthInitial());
  otpSent({required String phone}) => emit(AuthOtpSent(phone: phone));
}
