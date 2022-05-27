import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gcs/data/shared/shared_service.dart';

part 'auth_submit_otp_state.dart';

class AuthSubmitOtpCubit extends Cubit<AuthSubmitOtpState> {
  AuthSubmitOtpCubit() : super(AuthSubmitOtpInitial());

  Future submit({required String otp}) async {
    try {
      emit(AuthSubmitOtpLoading());
      await Future.delayed(const Duration(seconds: 2));
      await SharedServices.addUser(nic: "200129001050", uid: "001");
      emit(AuthSubmitOtpSucceed());
    } catch (e) {
      emit(AuthSubmitOtpFailed(errorMsg: e.toString()));
    }
  }
}
