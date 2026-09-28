import 'package:flutter/material.dart';
import '../models/data.dart';

class DetailScreen extends StatelessWidget {
  final Menu menu;
  const DetailScreen({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Melengkung rapi
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  menu.image,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 220,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 50),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Nama Menu
              Text(
                menu.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),

              // Kategori
              Text(
                menu.category,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 12),

              // Harga (Warna Hijau & Bold)
              Text(
                menu.price,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 16),

              // Label Judul Deskripsi
              const Text(
                'Deskripsi',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),

              // Isi Deskripsi
              Text(
                menu.description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  height: 1.4, // spasi antar baris teks
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}