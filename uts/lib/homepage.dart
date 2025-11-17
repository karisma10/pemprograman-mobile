import 'package:flutter/material.dart';
import 'formpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String nama = "-";
  String email = "-";
  String umur = "-";

  Future<void> _bukaForm() async {
    final hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormPage()),
    );

    if (hasil != null) {
      setState(() {
        nama = hasil["nama"];
        email = hasil["email"];
        umur = hasil["umur"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page"), centerTitle: true),

      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(16),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: _bukaForm,
                child: const Text("Buka Form Page"),
              ),
              const SizedBox(height: 20),

              Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      Text(
                        "Data Pengguna",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.pink.shade600,
                        ),
                      ),
                      const SizedBox(height: 10),

                      Row(
                        children: [
                          const Text(
                            "Nama: ",
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text(nama),
                        ],
                      ),
                      const SizedBox(height: 8),

                      Row(
                        children: [
                          const Text(
                            "Email: ",
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text(email),
                        ],
                      ),
                      const SizedBox(height: 8),

                      Row(
                        children: [
                          const Text(
                            "Umur: ",
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text(umur),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
