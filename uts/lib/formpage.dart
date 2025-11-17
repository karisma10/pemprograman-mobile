import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController namaC = TextEditingController();
  final TextEditingController emailC = TextEditingController();
  final TextEditingController umurC = TextEditingController();

  String? errNama;
  String? errEmail;
  String? errUmur;

  bool _validasi() {
    bool valid = true;

    setState(() {
      errNama = null;
      errEmail = null;
      errUmur = null;

      if (namaC.text.isEmpty) {
        errNama = "Nama harus diisi";
        valid = false;
      }

      if (emailC.text.isEmpty) {
        errEmail = "Email harus diisi";
        valid = false;
      } else if (!emailC.text.contains("@")) {
        errEmail = "Email tidak valid";
        valid = false;
      }

      if (umurC.text.isEmpty) {
        errUmur = "Umur harus diisi";
        valid = false;
      } else if (int.tryParse(umurC.text) == null ||
          int.parse(umurC.text) <= 0) {
        errUmur = "Umur harus angka > 0";
        valid = false;
      }
    });

    return valid;
  }

  void _kirim() {
    if (_validasi()) {
      Navigator.pop(context, {
        "nama": namaC.text,
        "email": emailC.text,
        "umur": umurC.text,
      });
    }
  }

  @override
  void dispose() {
    namaC.dispose();
    emailC.dispose();
    umurC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Page"), centerTitle: true),

      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(16),

          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // NAMA
                  TextField(
                    controller: namaC,
                    decoration: InputDecoration(
                      labelText: "Nama",
                      labelStyle: TextStyle(color: Colors.blue.shade600),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink.shade400,
                          width: 2,
                        ),
                      ),
                      errorText: errNama,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // EMAIL
                  TextField(
                    controller: emailC,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.blue.shade600),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink.shade400,
                          width: 2,
                        ),
                      ),
                      errorText: errEmail,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // UMUR
                  TextField(
                    controller: umurC,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "Umur",
                      labelStyle: TextStyle(color: Colors.blue.shade600),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.pink.shade400,
                          width: 2,
                        ),
                      ),
                      errorText: errUmur,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade500,
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Batal"),
                      ),
                      ElevatedButton(
                        onPressed: _kirim,
                        child: const Text("Kirim"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
