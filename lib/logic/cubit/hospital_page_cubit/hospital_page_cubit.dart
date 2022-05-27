import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/http/http_services.dart';
import '../../../data/models/hospital.dart';
import '../../../data/models/recent_hospital.dart';
import '../../../data/shared/shared_service.dart';

part 'hospital_page_state.dart';

class HospitalPageCubit extends Cubit<HospitalPageState> {
  HospitalPageCubit() : super(HospitalPageInitial());

  Future loadHospital() async {
    try {
      emit(HospitalPageLoading());
      final String nic = await SharedServices.getNic();
      final Hospital hospital = await HTTPServices.getHospital(nic: nic);
      final List<RecentHospital> recentHospitals =
          await HTTPServices.getRecentHospitals(nic: nic);
      emit(HospitalPageLoaded(
          hospital: hospital, recentHospitals: recentHospitals));
    } catch (e) {
      emit(HospitalPageFailed(errorMsg: e.toString()));
    }
  }
}
