import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'gallery_controller.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GalleryController());
    return Scaffold(
      body: GestureDetector(
        onTap:
            () => controller.isMenuOpen.value ? controller.toggleMenu() : null,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
              child: Column(
                children: [
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Obx(() {
                        if (controller.isLoading.value) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child:
                                controller.isImageVisible.value
                                    ? const HtmlElementView(
                                      viewType: 'image-container',
                                    )
                                    : const SizedBox(),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller.urlController,
                          decoration: const InputDecoration(
                            hintText: 'Image URL',
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Obx(
                        () => ElevatedButton(
                          onPressed: () {
                            controller.displayImage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
                            child:
                                controller.isLoading.value
                                    ? const SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                    : const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(() {
              if (!controller.isMenuOpen.value) return const SizedBox();
              return Stack(
                children: [
                  Container(color: Colors.black.withOpacity(0.5)),
                  Positioned(
                    right: 16,
                    bottom: 80,
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: const Text('Enter fullscreen'),
                              onTap: () => controller.handleFullscreen(true),
                            ),
                            const Divider(height: 1),
                            ListTile(
                              title: const Text('Exit fullscreen'),
                              onTap: () => controller.handleFullscreen(false),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.toggleMenu,
        child: const Icon(Icons.add),
      ),
    );
  }
}
