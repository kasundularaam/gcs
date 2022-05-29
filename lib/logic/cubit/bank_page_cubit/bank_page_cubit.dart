import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/http/http_services.dart';
import '../../../data/models/bank_person.dart';
import '../../../data/models/recent_bank.dart';
import '../../../data/shared/shared_service.dart';

part 'bank_page_state.dart';

class BankPageCubit extends Cubit<BankPageState> {
  BankPageCubit() : super(BankPageInitial());

  Future loadBankPage() async {
    try {
      emit(BankPageLoading());
      final String nic = await SharedServices.getNic();
      final Bank bank = await HTTPServices.getBank(nic: nic);
      final List<RecentBank> recentBanks =
          await HTTPServices.getRecentBanks(nic: nic);
      emit(BankPageLoaded(bank: bank, recentBanks: recentBanks));
    } catch (e) {
      emit(BankPageFailed(errorMsg: e.toString()));
    }
  }
}
