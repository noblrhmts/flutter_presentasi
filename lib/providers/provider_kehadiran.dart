import 'package:flutter/material.dart';

class ProviderKehadiran with ChangeNotifier {
  // Daftar siswa
  List<Map<String, dynamic>> siswas = [
    {'name': 'Ali', 'isPresent': false},
    {'name': 'Budi', 'isPresent': false},
    {'name': 'Citra', 'isPresent': false},
    {'name': 'Nobel', 'isPresent': false},
  ];

  // Riwayat kehadiran
  List<Map<String, dynamic>> historyKehadiran = [];

  void toggleKehadiran(int index) {
    siswas[index]['isPresent'] = !siswas[index]['isPresent'];
    notifyListeners();
  }

  void saveKehadiran() {
    final presentCount = siswas.where((s) => s['isPresent'] == true).length;
    final absentCount = siswas.length - presentCount;

    // Simpan ke riwayat
    historyKehadiran.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
    });

    // Reset status kehadiran
    for (var siswa in siswas) {
      siswa['isPresent'] = false;
    }
    notifyListeners();
  }
}
