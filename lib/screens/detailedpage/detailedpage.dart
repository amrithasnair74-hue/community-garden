import 'package:flutter/material.dart';

class UploadPhotoPage extends StatefulWidget {
  const UploadPhotoPage({super.key});

  @override
  State<UploadPhotoPage> createState() => _UploadPhotoPageState();
}

class _UploadPhotoPageState extends State<UploadPhotoPage> {
  String? selectedImage;

  final List<String> assetImages = [
    'assets/images/plant1.jpg',
    'assets/images/plant2.jpg',
    'assets/images/plant3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Photo"),
        backgroundColor: const Color(0xFF0F5C55),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),

          /// Preview area (replaces Image.file)
          Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(16),
            ),
            child: selectedImage == null
                ? const Icon(Icons.image, size: 80, color: Colors.grey)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      selectedImage!,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),

          const SizedBox(height: 16),

          const Text(
            "Select an image",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          /// Asset image selection grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: assetImages.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImage = assetImages[index];
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      assetImages[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}