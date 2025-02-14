import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webgallery/gallery/gallery_controller.dart';
import 'gallery/gallery.dart';

class WebGallery extends StatelessWidget {
  const WebGallery({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GalleryController());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web Gallery',
      theme: ThemeData(useMaterial3: true),
      home: const GalleryScreen(),
    );
  }
}
