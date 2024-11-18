import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_presentasi/providers/provider_kehadiran.dart';

class ScreenHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProviderKehadiran>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran'),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,),
      body: ListView.builder(
        itemCount: provider.historyKehadiran.length,
        itemBuilder: (context, index) {
          final history = provider.historyKehadiran[index];
          final date = DateFormat('dd MMM yyyy').format(history['date']);
          return ListTile(
            title: Text(date),
            subtitle: Text(
              'Hadir: ${history['present']}, Tidak Hadir: ${history['absent']}',
            ),
          );
        },
      ),
    );
  }
}
