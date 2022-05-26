import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_submit_nic_state.dart';

class AuthSubmitNicCubit extends Cubit<AuthSubmitNicState> {
  AuthSubmitNicCubit() : super(AuthSubmitNicInitial());

  Future submit({required String nic}) async {
    try {
      emit(AuthSubmitNicLoading());
      emit(AuthSubmitNicSucceed(phone: "+94703554519"));
    } catch (e) {
      emit(AuthSubmitNicFailed(errorMsg: e.toString()));
    }
  }
}
