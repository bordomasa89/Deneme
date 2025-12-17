import 'package:flutter/material.dart';

class EtkinlikEklePage extends StatelessWidget {
  const EtkinlikEklePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yeni Etkinlik Oluştur")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Etkinlik Adı")),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: "Tarih/Saat")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Etkinlik Kaydedildi!")));
                Navigator.pop(context); // Önceki sayfaya döner
              },
              child: const Text("KAYDET"),
            )
          ],
        ),
      ),
    );
  }
}