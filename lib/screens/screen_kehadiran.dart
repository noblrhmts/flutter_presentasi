import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_presentasi/providers/provider_kehadiran.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);

    // Format tanggal saat ini
    final currentDate = DateFormat('dd MMM yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa'),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.students.length,
              itemBuilder: (context, index) {
                final student = provider.students[index];
                return ListTile(
                  title: Text(student['name']),
                  trailing: Checkbox(
                    value: student['isPresent'],
                    onChanged: (_) => provider.toggleAttendance(index),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentDate,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: provider.students.isEmpty ? null : provider.saveAttendance,
                  child: Text('Simpan Kehadiran'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
