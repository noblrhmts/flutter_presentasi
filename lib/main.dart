import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_presentasi/providers/provider_kehadiran.dart';
import 'package:flutter_presentasi/screens/screen_kehadiran.dart';
import 'package:flutter_presentasi/screens/screen_history.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProviderKehadiran(),
      child: MaterialApp(
        home: LayarUtama(),
      ),
    ),
  );
}

class LayarUtama extends StatefulWidget {
  @override
  _StateLayarUtama createState() => _StateLayarUtama();
}

class _StateLayarUtama extends State<LayarUtama> {
  int _selectedIndex = 0;
  final _screens = [ScreenKehadiran(), ScreenHistory()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Pencatatan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
        ],
      ),
    );
  }
}
