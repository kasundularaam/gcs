import 'package:gcs/data/models/bank_person.dart';
import 'package:gcs/data/models/recent_bank.dart';

import '../models/bank_res.dart';
import '../models/hospital.dart';
import '../models/hospital_res.dart';
import '../models/person.dart';
import '../models/person_res.dart';
import '../models/recent_hospital.dart';

class HTTPServices {
  static Future<Person> getPerson({required String nic}) async {
    try {
      final PersonRes personRes = PersonRes.fromMap({});
      return personRes.person;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Hospital> getHospital({required String nic}) async {
    try {
      final HospitalRes hospitalRes = HospitalRes.fromMap({});
      return hospitalRes.hospital;
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<Bank> getBank({required String nic}) async {
    try {
      final BankRes bankRes = BankRes.fromMap({});
      return bankRes.banks[0];
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<RecentHospital>> getRecentHospitals(
      {required String nic}) async {
    try {
      return [];
    } catch (e) {
      throw e.toString();
    }
  }

  static Future<List<RecentBank>> getRecentBanks({required String nic}) async {
    try {
      return [];
    } catch (e) {
      throw e.toString();
    }
  }
}
