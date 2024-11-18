import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_presentasi/providers/provider_kehadiran.dart';

class ScreenKehadiran extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderKehadiran>(context);

    // Format tanggal saat ini
    final tanggal = DateFormat('dd MMM yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: Text('Presensi Siswa'),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.siswas.length,
              itemBuilder: (context, index) {
                final student = provider.siswas[index];
                return ListTile(
                  title: Text(student['name']),
                  trailing: Checkbox(
                    value: student['isPresent'],
                    onChanged: (_) => provider.toggleKehadiran(index),
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
                  tanggal,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: provider.siswas.isEmpty ? null : provider.saveKehadiran,
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
