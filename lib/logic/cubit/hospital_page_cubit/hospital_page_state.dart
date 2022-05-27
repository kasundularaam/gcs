part of 'hospital_page_cubit.dart';

abstract class HospitalPageState {}

class HospitalPageInitial extends HospitalPageState {}

class HospitalPageLoading extends HospitalPageState {}

class HospitalPageLoaded extends HospitalPageState {
  final Hospital hospital;
  final List<RecentHospital> recentHospitals;
  HospitalPageLoaded({
    required this.hospital,
    required this.recentHospitals,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HospitalPageLoaded &&
        other.hospital == hospital &&
        listEquals(other.recentHospitals, recentHospitals);
  }

  @override
  int get hashCode => hospital.hashCode ^ recentHospitals.hashCode;

  @override
  String toString() =>
      'HospitalPageLoaded(hospital: $hospital, recentHospitals: $recentHospitals)';
}

class HospitalPageFailed extends HospitalPageState {
  final String errorMsg;
  HospitalPageFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HospitalPageFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'HospitalPageFailed(errorMsg: $errorMsg)';
}
