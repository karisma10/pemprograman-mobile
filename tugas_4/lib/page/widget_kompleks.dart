import 'package:flutter/material.dart';
import 'package:tugas_4/page/detail_page.dart';

class WidgetKompleksPage extends StatelessWidget {
  const WidgetKompleksPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data untuk ListView
    final List<Map<String, String>> listData = List.generate(
      6,
      (index) => {
        "nama": "Kontak ${index + 1}",
        "deskripsi": "Deskripsi kontak ${index + 1}",
      },
    );

    // Data untuk GridView
    final List<Map<String, dynamic>> gridData = [
      {"icon": Icons.favorite, "text": "Love", "color": Colors.pinkAccent},
      {"icon": Icons.star, "text": "Star", "color": Colors.amber},
      {"icon": Icons.coffee, "text": "Coffee", "color": Colors.brown},
      {"icon": Icons.home, "text": "Home", "color": Colors.blueAccent},
      {"icon": Icons.phone, "text": "Phone", "color": Colors.green},
      {"icon": Icons.camera_alt, "text": "Camera", "color": Colors.deepPurple},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Kompleks - ListView & GridView"),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==================== Bagian ListView ====================
              const Text(
                "Daftar Kontak",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),

              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listData.length,
                itemBuilder: (context, index) {
                  final item = listData[index];
                  return Card(
                    color: Colors.blue.shade50,
                    elevation: 4,
                    shadowColor: Colors.pinkAccent.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.pink.shade100,
                        child: Text(
                          item["nama"]![7],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        item["nama"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        item["deskripsi"]!,
                        style: const TextStyle(color: Colors.black54),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.pinkAccent,
                        size: 18,
                      ),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Kamu menekan ${item["nama"]}"),
                            backgroundColor: Colors.pinkAccent,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

              const SizedBox(height: 25),

              // ==================== Bagian GridView ====================
              const Text(
                "Menu Ikon",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent,
                ),
              ),
              const SizedBox(height: 10),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: gridData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: (context, index) {
                  final item = gridData[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            title: item["text"],
                            icon: item["icon"],
                            color: item["color"],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.blue.shade50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 5,
                      shadowColor: item["color"].withOpacity(0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(item["icon"], size: 40, color: item["color"]),
                          const SizedBox(height: 8),
                          Text(
                            item["text"],
                            style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
