import 'package:flutter/material.dart';
import 'login_screen.dart'; // Yeni dosyamızı içe aktardık

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(), // Uygulama giriş ekranıyla başlasın
  ));
}