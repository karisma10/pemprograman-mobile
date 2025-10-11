import 'package:flutter/material.dart';

void main() {
  runApp(const BelajarWidget());
}

class BelajarWidget extends StatelessWidget {
  const BelajarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const CampgroundDetailPage(),
    );
  }
}

class CampgroundDetailPage extends StatelessWidget {
  const CampgroundDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Image.network(
              'https://asset.kompas.com/crops/ziB7K8w4wxaZHsZjUYDqB8xNhiw=/0x80:800x480/1200x800/data/photo/2017/06/29/3191616385.jpg',
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 240,
                  color: const Color.fromARGB(255, 135, 208, 245),
                  child: const Icon(Icons.image, size: 100, color: Colors.grey),
                );
              },
            ),

            // Title and Rating Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gunung Papandayan',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Garut, jawa Barat',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.red[500], size: 28),
                      const SizedBox(width: 4),
                      const Text(
                        '41',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Action Buttons Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    icon: Icons.call,
                    label: 'CALL',
                    color: Colors.blue[700]!,
                  ),
                  _buildActionButton(
                    icon: Icons.near_me,
                    label: 'ROUTE',
                    color: Colors.blue[700]!,
                  ),
                  _buildActionButton(
                    icon: Icons.share,
                    label: 'SHARE',
                    color: Colors.blue[700]!,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Description Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Gunung Papandayan adalah gunung api aktif di Kabupaten Garut, Jawa Barat, yang terkenal sebagai destinasi populer bagi pendaki pemula karena medannya yang landai dan telah dilengkapi fasilitas. Gunung dengan ketinggian 2.665 mdpl ini menawarkan berbagai keindahan alam seperti kawah aktif, padang bunga edelweiss di Pondok Saladah, dan Hutan Mati, serta menjadi bagian dari Taman Wisata Alam (TWA) Papandayan yang dikelola untuk pariwisata.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: color,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}
