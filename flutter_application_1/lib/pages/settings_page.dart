import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.palette),
                title: Text("Tema Aplikasi"),
                subtitle: Text("Ganti warna utama aplikasi"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text("Notifikasi"),
                subtitle: Text("Kelola notifikasi aplikasi"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.info),
                title: Text("Tentang Aplikasi"),
                subtitle: Text("Versi 1.0.0 - Dibuat dengan Flutter"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
