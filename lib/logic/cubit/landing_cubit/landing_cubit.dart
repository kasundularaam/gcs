import 'dart:developer';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gcs/data/shared/shared_service.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());

  Future loadApp() async {
    try {
      log("HELOOOO");
      emit(LandingLoading());
      await Future.delayed(const Duration(seconds: 2));
      final bool isExist = await SharedServices.isUserIn();
      log(isExist.toString());
      if (isExist) {
        emit(LandingToHome());
      } else {
        emit(LandingToAuth());
      }
    } catch (e) {
      emit(LandingFailed(errorMsg: e.toString()));
    }
  }
}
