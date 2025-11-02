import 'package:flutter/material.dart';
import 'detail_page.dart';

class MainPage extends StatelessWidget {
  final String name = "Riska"; // bisa diganti sesuai keinginan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, $name!',
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Pergi ke halaman detail
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(name: name),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
              child: const Text('Pergi ke Halaman Detail'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Kembali ke Homepage
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Kembali ke Homepage'),
            ),
          ],
        ),
      ),
    );
  }
}
