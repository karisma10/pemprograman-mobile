import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10, (i) => "Item ke-${i + 1}");

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.star, color: Colors.amber),
          title: Text(items[index]),
          subtitle: const Text("Mahasiswa"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        );
      },
    );
  }
}

// 🧱 GridView Page
// ======================
class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.orange,
      Colors.purple,
      Colors.teal,
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.all(8),
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
    );
  }
}

// ======================
// 💳 Card Page
// ======================
class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> data = [
      {"nama": "Riska Karisma", "status": "Mahasiswa"},
      {"nama": "Alfi Aulia", "status": "Mahasiswa"},
      {"nama": "Rizal", "status": "Mahasiswa"},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(data[index]["nama"]![0]),
            ),
            title: Text(data[index]["nama"]!),
            subtitle: Text(data[index]["status"]!),
          ),
        );
      },
    );
  }
}
