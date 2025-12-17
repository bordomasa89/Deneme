import 'package:flutter/material.dart';
import 'etkinlik_ekle.dart'; // Yeni sayfayı buraya bağladık
import 'login_screen.dart'; // Çıkış yapınca geri dönmek için

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Hafif gri arka plan
      appBar: AppBar(
        title: const Text(
          "ANA MENÜ",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF1e3c72),
        iconTheme: const IconThemeData(color: Colors.white), // 3 çizgi ikonunu beyaz yapar
      ),
      
      // SOLDAKİ 3 ÇİZGİ PANELİ (DRAWER)
      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF1e3c72)),
              accountName: Text("Yazılım Geliştirici", style: TextStyle(fontSize: 18)),
              accountEmail: Text("admin@uygulamaniz.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 45, color: Color(0xFF1e3c72)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFF1e3c72)),
              title: const Text("Ana Sayfa"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.notifications, color: Color(0xFF1e3c72)),
              title: const Text("Duyurular"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF1e3c72)),
              title: const Text("Ayarlar"),
              onTap: () {},
            ),
            const Spacer(), // Aradaki boşluğu doldurur, çıkış butonunu en alta iter
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Çıkış Yap", style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),

      // ANA MENÜ İÇERİĞİ
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2, // Yan yana 2 kutu
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: [
            _menuKutusu(
              context, 
              "Etkinlik", 
              Icons.add_task, 
              Colors.orange,
              const EtkinlikEklePage() // Etkinlik sayfasına gider
            ),
            _menuKutusu(
              context, 
              "Takvim", 
              Icons.calendar_month, 
              Colors.green,
              null // Henüz sayfası yok
            ),
            _menuKutusu(
              context, 
              "Mesajlar", 
              Icons.message_outlined, 
              Colors.blue,
              null
            ),
            _menuKutusu(
              context, 
              "Profil", 
              Icons.account_circle, 
              Colors.purple,
              null
            ),
          ],
        ),
      ),
    );
  }

  // Menü Kartlarını Oluşturan Yardımcı Fonksiyon
  Widget _menuKutusu(BuildContext context, String baslik, IconData ikon, Color renk, Widget? hedefSayfa) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          if (hedefSayfa != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => hedefSayfa),
            );
          } else {
            // Sayfa henüz yoksa küçük bir uyarı verir
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("$baslik sayfası yakında eklenecek!")),
            );
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: renk.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(ikon, size: 40, color: renk),
            ),
            const SizedBox(height: 12),
            Text(
              baslik,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}