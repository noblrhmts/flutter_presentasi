import 'package:flutter/material.dart';

class AttendanceProvider with ChangeNotifier {
  // Daftar siswa sebagai Map
  List<Map<String, dynamic>> students = [
    {'name': 'Ali', 'isPresent': false},
    {'name': 'Budi', 'isPresent': false},
    {'name': 'Citra', 'isPresent': false},
    {'name': 'Nobel', 'isPresent': false},
  ];

  // Riwayat kehadiran
  List<Map<String, dynamic>> attendanceHistory = [];

  void toggleAttendance(int index) {
    students[index]['isPresent'] = !students[index]['isPresent'];
    notifyListeners();
  }

  void saveAttendance() {
    final presentCount = students.where((s) => s['isPresent'] == true).length;
    final absentCount = students.length - presentCount;

    // Simpan ke riwayat
    attendanceHistory.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
    });

    // Reset status kehadiran
    for (var student in students) {
      student['isPresent'] = false;
    }
    notifyListeners();
  }
}
