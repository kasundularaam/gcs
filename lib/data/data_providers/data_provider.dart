import '../../core/configs/configs.dart';

class DataProvider {
  static String phoneByNIC(String nic) =>
      "$url/api/PersonalDetails/selectPhoneNumberByNIC/$nic";

  static String personByNIC(String nic) =>
      "$url/api/PersonalDetails/selectPersonalDetailsByNIC/$nic";

  static String bankByNIC(String nic) =>
      "$url/api/BankDetails/selectBankDetailsByNIC/$nic";
  static String recentBanks(String nic) =>
      "$url/api/BankDetails/selectRecentBanks/$nic";

  static String hospitalByNIC(String nic) =>
      "$url/api/HospitalDetails/selectHospitalDetailsByNIC/$nic";
  static String recentHospitals(String nic) =>
      "$url/api/HospitalDetails/selectRecentHospitalsByNIC/$nic";
}
