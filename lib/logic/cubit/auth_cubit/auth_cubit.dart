import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/firebase/fire_auth.dart';
import '../../../data/http/http_services.dart';
import '../../../data/models/select_phone.dart';
import '../../../data/shared/shared_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Timer? timer;
  int timeLeft = 60;

  Future<void> requestAuth({required String nic}) async {
    try {
      emit(AuthLoading());
      final SelectPhone selectPhone = await HTTPServices.getPhone(nic: nic);
      final String phone = selectPhone.phoneNumber;
      if (phone.length == 12) {
        await FireAuth.varifyPhone(
            phone: phone,
            verificationCompleted: (credential) =>
                FireAuth.signIn(credential: credential),
            verificationFailed: (e) => emit(AuthFailed(errorMsg: e.toString())),
            codeSent: (verificationId) =>
                codeSentState(verificationId: verificationId, phone: phone),
            codeAutoRetrievalTimeout: (verificationId) {
              timeLeft = 60;
              timer!.cancel();
              timer = null;
              emit(AuthTimeOut(verificationId: verificationId, phone: phone));
            });
      } else {
        emit(AuthFailed(errorMsg: "Invalid number!"));
        emit(AuthInitial());
      }
    } catch (e) {
      emit(AuthFailed(errorMsg: e.toString()));
    }
  }

  void codeSentState({required String verificationId, required String phone}) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timeLeft--;
      emit(
        AuthCodeSent(
          verificationId: verificationId,
          timeLeft: "$timeLeft",
          phone: phone,
        ),
      );
    });
  }

  Future<void> verifyOTP(
      {required String smsCode,
      required String verificationId,
      required String phone,
      required String nic}) async {
    try {
      emit(AuthLoading());
      if (smsCode.length == 6) {
        AuthCredential credential = await FireAuth.verifyOTP(
            smsCode: smsCode, verificationId: verificationId);
        timeLeft = 60;
        timer!.cancel();
        timer = null;
        await FireAuth.signIn(credential: credential);
        SharedServices.addUser(nic: nic);
        emit(AuthSucceed());
      } else {
        emit(AuthInvalidOTP(
            errorMsg: "Invalid OTP", verificationId: verificationId));
        codeSentState(verificationId: verificationId, phone: phone);
      }
    } catch (e) {
      emit(AuthInvalidOTP(
          errorMsg: e.toString(), verificationId: verificationId));
      codeSentState(verificationId: verificationId, phone: phone);
    }
  }

  void changeNumber() {
    timeLeft = 60;
    timer!.cancel();
    timer = null;
    emit(AuthInitial());
  }
}
