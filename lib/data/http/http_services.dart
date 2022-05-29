import 'package:gcs/data/models/recent_banks_res.dart';
import 'package:gcs/data/models/select_phone.dart';
import 'package:gcs/data/models/select_phone_res.dart';
import 'package:http/http.dart' as http;

import '../data_providers/data_provider.dart';
import '../models/bank_person.dart';
import '../models/bank_res.dart';
import '../models/hospital.dart';
import '../models/hospital_res.dart';
import '../models/person.dart';
import '../models/person_res.dart';
import '../models/recent_bank.dart';
import '../models/recent_hospital.dart';
import '../models/recent_hospitals_res.dart';

class HTTPServices {
  static Future<Person> getPerson({required String nic}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.personByNIC(nic),
        ),
      );
      if (res.statusCode == 200) {
        final PersonRes personRes = PersonRes.fromJson(res.body);
        return personRes.person;
      }
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Hospital> getHospital({required String nic}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.hospitalByNIC(nic),
        ),
      );

      if (res.statusCode == 200) {
        final HospitalRes hospitalRes = HospitalRes.fromJson(res.body);

        return hospitalRes.hospital;
      }
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Bank> getBank({required String nic}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.bankByNIC(nic),
        ),
      );
      if (res.statusCode == 200) {
        final BankRes bankRes = BankRes.fromJson(res.body);
        return bankRes.banks[0];
      }
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<RecentHospital>> getRecentHospitals(
      {required String nic}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.recentHospitals(nic),
        ),
      );
      if (res.statusCode == 200) {
        final RecentHospitalsRes recentHospitalsRes =
            RecentHospitalsRes.fromJson(res.body);
        return recentHospitalsRes.recentHospitals;
      }
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<RecentBank>> getRecentBanks({required String nic}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.recentBanks(nic),
        ),
      );
      if (res.statusCode == 200) {
        final RecentBanksRes recentBanksRes = RecentBanksRes.fromJson(res.body);
        return recentBanksRes.recentBanks;
      }
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<SelectPhone> getPhone({required String nic}) async {
    try {
      final res = await http.get(
        Uri.parse(
          DataProvider.phoneByNIC(nic),
        ),
      );
      if (res.statusCode == 200) {
        final SelectPhoneRes phoneRes = SelectPhoneRes.fromJson(res.body);
        return phoneRes.phone;
      }
      throw "Failed to load data";
    } catch (e) {
      throw e.toString();
    }
  }
}
