import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Kompleks Flutter',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(5, (i) => "Item ke-${i + 1}");
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];
    final data = [
      {"nama": "Riska Karisma", "status": "Mahasiswa"},
      {"nama": "Alfi Aulia", "status": "Mahasiswa"},
      {"nama": "Rizal", "status": "Mahasiswa"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gabungan ListView, GridView, dan Card'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------------------------
            // Bagian ListView
            // ----------------------------
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "📋 ListView",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: items.map((item) {
                return ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber),
                  title: Text(item),
                  subtitle: const Text("Mahasiswa"),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                );
              }).toList(),
            ),

            const Divider(thickness: 2),

            // ----------------------------
            // Bagian GridView
            // ----------------------------
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "🧱 GridView",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              shrinkWrap: true, // biar bisa scroll bareng parent
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Kotak ${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),

            const Divider(thickness: 2),

            // ----------------------------
            // Bagian Card
            // ----------------------------
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "💳 Card",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: data.map((item) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      child: Text(item["nama"]![0]),
                    ),
                    title: Text(item["nama"]!),
                    subtitle: Text(item["status"]!),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
